require 'spec_helper'
require_relative '../../app/presenter/book_presenter'
require_relative '../../app/domain/entity/book'

RSpec.describe App::Presenter::BookPresenter do
  describe '.to_json' do
    let(:book) { App::Entity::Book.new(id: '2d931510-d99f-494a-8c67-87feb05e1594', title: 'Clean Code', author: 'Robert C. Martin') }
    
    it 'returns JSON representation of a book' do
      json_output = described_class.to_json(book)
      expected_json = {
        id: '2d931510-d99f-494a-8c67-87feb05e1594',
        title: 'Clean Code',
        author: 'Robert C. Martin'
      }.to_json
      
      expect(json_output).to eq(expected_json)
    end
  end

  describe '.to_json_array' do
    let(:books) {
      [
        App::Entity::Book.new(id: '2d931510-d99f-494a-8c67-87feb05e1594', title: 'Clean Code', author: 'Robert C. Martin'),
        App::Entity::Book.new(id: '1e11cc58-8f5b-65dd-5175-5040a7a313a6', title: 'Pragmatic Programmer', author: 'Andy Hunt and Dave Thomas')
      ]
    }

    it 'returns JSON representation of an array of books' do
      json_output = described_class.to_json_array(books)
      expected_json = [
        { id: '2d931510-d99f-494a-8c67-87feb05e1594', title: 'Clean Code', author: 'Robert C. Martin' },
        { id: '1e11cc58-8f5b-65dd-5175-5040a7a313a6', title: 'Pragmatic Programmer', author: 'Andy Hunt and Dave Thomas' }
      ].to_json

      expect(json_output).to eq(expected_json)
    end
  end
end
