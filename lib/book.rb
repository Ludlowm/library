class Book
  @@all_books = []
  attr_accessor(:title, :author, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @book_id = attributes.fetch(:book_id)
  end

  def Book.all
    @@all_books
  end

  def save
    @@all_books.push(self)
  end
end
