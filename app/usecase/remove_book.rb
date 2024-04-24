module App
  module UseCase
    class RemoveBook
      def initialize(book_repository)
        @book_repository = book_repository
      end

      def execute(id:)
        @book_repository.remove(id)
      end
    end
  end
end
