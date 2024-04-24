require 'securerandom'

module App
  module Entity
      class Book
        attr_reader :id, :title, :author

        def initialize(id: SecureRandom.uuid, title:, author:)
            @id = id
            @title = title
            @author = author
        end
      end
  end
end
