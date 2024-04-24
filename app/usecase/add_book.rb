require_relative '../domain/entity/book'
require_relative '../domain/repository/book_repository'

module App
  module UseCase
    class AddBook
      def initialize(book_repository)
        @book_repository = book_repository
      end

      def execute(title:, author:)
        book = App::Entity::Book.new(title: title, author: author)
        @book_repository.add(book)
        book
      end
    end
  end
end
