require_relative '../usecase/add_book'
require_relative '../usecase/list_books'
require_relative '../usecase/remove_book'
require_relative '../presenter/book_presenter'

module App
  module Controller
    class BooksController
      def initialize(add_book, list_books, remove_book)
        @add_book_use_case = add_book
        @list_books_use_case = list_books
        @remove_book_use_case = remove_book
      end

      def add_book(params)
        book = @add_book_use_case.execute(title: params["title"], author: params["author"])
        App::Presenter::BookPresenter.to_json(book)
      end

      def list_books
        books = @list_books_use_case.execute
        App::Presenter::BookPresenter.to_json_array(books)
      end

      def remove_book(id)
        begin
          @remove_book_use_case.execute(id: id)
          { success: true, message: "Book removed successfully" }.to_json
        rescue StandardError => e
          { success: false, error: e.message }.to_json
        end
      end
    end
  end
end
