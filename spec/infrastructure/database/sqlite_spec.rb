require 'spec_helper'
require_relative '../../../app/infrastructure/database/sqlite'

RSpec.describe App::SQLite do
  describe '.new_db' do
    let(:fake_db) { instance_double(SQLite3::Database) }

    before do
      allow(SQLite3::Database).to receive(:new).and_return(fake_db)
      allow(fake_db).to receive(:execute)
    end

    it 'creates a new SQLite database with books table' do
      expect(SQLite3::Database).to receive(:new).with('books.db')
      expect(fake_db).to receive(:execute).with(<<-SQL)
        CREATE TABLE IF NOT EXISTS books (
          id TEXT PRIMARY KEY,
          title TEXT,
          author TEXT
        );
      SQL

      db = App::SQLite.new_db

      expect(db).to eq(fake_db)
    end
  end
end
