require 'spec_helper'
require_relative '../../app/domain/repository/book_repository'
require_relative '../../app/usecase/remove_book'

RSpec.describe App::UseCase::RemoveBook do
  let(:book_repository) { instance_double(App::Repository::BookRepository) }
  let(:remove_book) { described_class.new(book_repository) }
  let(:book_id) { '123' }
  
  describe '#execute' do
    it 'calls the repository to remove a book by id' do
      # Set up an expectation that book_repository will receive the remove method with the book_id
      expect(book_repository).to receive(:remove).with(book_id)

      # Execute the use case
      remove_book.execute(id: book_id)

      # No need to check return value since remove does not necessarily return anything
    end
  end
end
