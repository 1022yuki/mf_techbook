module App
  module Repository
    class BookRepository
      def add(book)
        raise NotImplementedError
      end

      def remove(id)
        raise NotImplementedError
      end

      def list
        raise NotImplementedError
      end
    end
  end
end
