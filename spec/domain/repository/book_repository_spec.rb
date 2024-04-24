require 'spec_helper'
require_relative '../../../app/domain/repository/book_repository'

RSpec.describe App::Repository::BookRepository do
  describe '#add' do
    it 'raises NotImplementedError' do
      expect { subject.add(nil) }.to raise_error(NotImplementedError)
    end
  end

  describe '#remove' do
    it 'raises NotImplementedError' do
      expect { subject.remove(nil) }.to raise_error(NotImplementedError)
    end
  end

  describe '#list' do
    it 'raises NotImplementedError' do
      expect { subject.list }.to raise_error(NotImplementedError)
    end
  end
end
