require 'json'

module App
  module Presenter
    class BookPresenter
      def self.to_json(book)
        {
          id: book.id,
          title: book.title,
          author: book.author,
        }.to_json
      end

      def self.to_json_array(books)
        books.map { |book| 
          {
            id: book.id,
            title: book.title,
            author: book.author,
          }
        }.to_json
      end
    end
  end
end
