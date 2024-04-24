require 'spec_helper'
require_relative '../../app/controller/books_controller'
require 'json'

RSpec.describe App::Controller::BooksController do
  let(:add_book_use_case) { instance_double(App::UseCase::AddBook) }
  let(:list_books_use_case) { instance_double(App::UseCase::ListBooks) }
  let(:remove_book_use_case) { instance_double(App::UseCase::RemoveBook) }
  let(:controller) { described_class.new(add_book_use_case, list_books_use_case, remove_book_use_case) }
  
  describe '#add_book' do
    let(:params) { { "title" => "Test Book", "author" => "Test Author" } }
    let(:book) { instance_double(App::Entity::Book, id: "2d931510-d99f-494a-8c67-87feb05e1594", title: "Test Book", author: "Test Author") }

    it 'calls add_book use case and returns the book as JSON' do
      expect(add_book_use_case).to receive(:execute).with(title: "Test Book", author: "Test Author").and_return(book)
      expect(App::Presenter::BookPresenter).to receive(:to_json).with(book).and_return(book.to_json)

      response = controller.add_book(params)
      expect(response).to eq(book.to_json)
    end
  end

  describe '#list_books' do
    let(:books) { [instance_double(App::Entity::Book, id: "2d931510-d99f-494a-8c67-87feb05e1594", title: "Test Book", author: "Test Author")] }

    it 'calls list_books use case and returns the books as JSON' do
      expect(list_books_use_case).to receive(:execute).and_return(books)
      expect(App::Presenter::BookPresenter).to receive(:to_json_array).with(books).and_return(books.to_json)

      response = controller.list_books
      expect(response).to eq(books.to_json)
    end
  end

  describe '#remove_book' do
    let(:book_id) { "1" }

    it 'successfully removes a book' do
      expect(remove_book_use_case).to receive(:execute).with(id: book_id)
      expect(controller.remove_book(book_id)).to eq({ success: true, message: "Book removed successfully" }.to_json)
    end

    it 'handles errors when removing a book' do
      allow(remove_book_use_case).to receive(:execute).with(id: book_id).and_raise(StandardError, "An error occurred")
      expect(controller.remove_book(book_id)).to eq({ success: false, error: "An error occurred" }.to_json)
    end
  end
end
