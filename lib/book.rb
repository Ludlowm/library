class Book
  @@all_books = []
  attr_accessor(:title, :author, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = attributes.fetch(:id)
  end

  def Book.all
    @@all_books
  end

  def save
    @@all_books.push(self)
  end

  def Book.find(book_id)
    found_book = nil
    @@all_books.each() do |book|
      if book.id().eql?(book_id)
        found_book = book_id
      end
    end
    found_book
  end
end
