require 'spec_helper'
require_relative '../../app/domain/entity/book'
require_relative '../../app/domain/repository/book_repository'
require_relative '../../app/usecase/list_books'

RSpec.describe App::UseCase::ListBooks do
  let(:book_repository) { instance_double(App::Repository::BookRepository) }
  let(:list_books) { described_class.new(book_repository) }
  
  describe '#execute' do
    it 'retrieves a list of books from the repository' do
      # Prepare a fake list of books
      fake_books = [
        App::Entity::Book.new(id: '2d931510-d99f-494a-8c67-87feb05e1594', title: 'Clean Code', author: 'Robert C. Martin'),
        App::Entity::Book.new(id: '1e11cc58-8f5b-65dd-5175-5040a7a313a6', title: 'Pragmatic Programmer', author: 'Andy Hunt and Dave Thomas')
      ]

      # Expect the book_repository to receive the list method and return the fake books
      expect(book_repository).to receive(:list).and_return(fake_books)

      # Execute the use case
      result = list_books.execute

      # Verify that the result contains the correct data
      expect(result).to match_array(fake_books)
    end
  end
end
