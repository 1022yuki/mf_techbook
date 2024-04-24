require 'sqlite3'

module App
  class SQLite
    def self.new_db
      db = SQLite3::Database.new 'books.db'
      db.execute <<-SQL
        CREATE TABLE IF NOT EXISTS books (
          id TEXT PRIMARY KEY,
          title TEXT,
          author TEXT
        );
      SQL
      db
    end
  end
end
