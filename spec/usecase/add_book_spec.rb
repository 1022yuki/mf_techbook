require 'spec_helper'
require_relative '../../app/domain/entity/book'
require_relative '../../app/domain/repository/book_repository'
require_relative '../../app/usecase/add_book'

RSpec.describe App::UseCase::AddBook do
  let(:book_repository) { instance_double(App::Repository::BookRepository) }
  let(:add_book) { described_class.new(book_repository) }
  let(:title) { 'Clean Code' }
  let(:author) { 'Robert C. Martin' }

  describe '#execute' do
    it 'creates a new book and adds it to the repository' do
      expect(App::Entity::Book).to receive(:new).with(title: title, author: author).and_call_original
      expect(book_repository).to receive(:add).with(instance_of(App::Entity::Book))

      book = add_book.execute(title: title, author: author)

      expect(book).to be_a(App::Entity::Book)
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end
  end
end
