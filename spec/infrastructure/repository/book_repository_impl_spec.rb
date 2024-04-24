require 'spec_helper'
require_relative '../../../app/infrastructure/repository/book_repository_impl'
require_relative '../../../app/domain/entity/book'

RSpec.describe App::Repository::BookRepositoryImpl do
  let(:db) { double('SQLite3::Database') }
  let(:repository) { described_class.new(db) }
  let(:book) { App::Entity::Book.new(id: '2d931510-d99f-494a-8c67-87feb05e1594', title: 'Test Book', author: 'Test Author') }

  describe '#add' do
    it 'executes an INSERT SQL statement to add a book' do
      expect(db).to receive(:execute).with("INSERT INTO books (id, title, author) VALUES (?, ?, ?)", [book.id, book.title, book.author])
      repository.add(book)
    end
  end

  describe '#list' do
    it 'executes a SELECT SQL statement and returns an array of books' do
      rows = [['2d931510-d99f-494a-8c67-87feb05e1594', 'Test Book', 'Test Author']]
      expect(db).to receive(:execute).with("SELECT * FROM books").and_return(rows)
      result = repository.list
      expect(result.size).to eq(1)
      expect(result.first).to be_a(App::Entity::Book)
      expect(result.first.id).to eq('2d931510-d99f-494a-8c67-87feb05e1594')
    end
  end

  describe '#remove' do
    it 'executes a DELETE SQL statement to remove a book' do
      expect(db).to receive(:execute).with("DELETE FROM books WHERE id = ?", [book.id])
      repository.remove(book.id)
    end
  end
end
