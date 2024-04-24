require 'sqlite3'
require_relative '../../domain/entity/book'
require_relative '../../domain/repository/book_repository'

module App
  module Repository
    class BookRepositoryImpl < App::Repository::BookRepository
      def initialize(db)
        @db = db
      end

      def add(book)
        @db.execute("INSERT INTO books (id, title, author) VALUES (?, ?, ?)", [book.id, book.title, book.author])
      end
      
      def list
        @db.execute("SELECT * FROM books").map do |row|
          App::Entity::Book.new(id: row[0], title: row[1], author: row[2])
        end
      end

      def remove(id)
        @db.execute("DELETE FROM books WHERE id = ?", [id])
      end
    end
  end
end
