require 'spec_helper'
require_relative '../../../app/domain/entity/book'

RSpec.describe App::Entity::Book do
  describe '#initialize' do
    context 'when initialized with title and author' do
      let(:title) { 'Clean Code' }
      let(:author) { 'Robert C. Martin' }
      let(:book) { described_class.new(title: title, author: author) }

      it 'creates a new book with a unique UUID' do
        expect(book.id).to be_a String
        expect(book.id).to match(/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/)
      end

      it 'assigns a title and author to the book' do
        expect(book.title).to eq(title)
        expect(book.author).to eq(author)
      end
    end

    context 'when missing title or author' do
      it 'raises an ArgumentError when title is missing' do
        expect { described_class.new(author: 'Author Name') }.to raise_error(ArgumentError)
      end

      it 'raises an ArgumentError when author is missing' do
        expect { described_class.new(title: 'Book Title') }.to raise_error(ArgumentError)
      end
    end
  end
end
