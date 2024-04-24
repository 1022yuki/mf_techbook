module App
  module UseCase
    class ListBooks
      def initialize(book_repository)
        @book_repository = book_repository
      end

      def execute
        @book_repository.list
      end
    end
  end
end
