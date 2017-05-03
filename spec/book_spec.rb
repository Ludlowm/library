require "book"
require "rspec"
require "pry"
require "pg"

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
  end
end

describe(Book) do
  describe('#title') do
    it('will create a new book by title') do
      test_book = Book.new({:title => 'Outliers', :author => 'Malcolm Gladwell', :book_id => nil})
      expect(test_book.title).to(eq('Outliers'))
    end
  end

  describe('#author') do
    it('will add an author to a book') do
      test_book = Book.new({:title => 'Outliers', :author => 'Malcolm Gladwell', :book_id => nil})
      expect(test_book.author).to(eq('Malcolm Gladwell'))
    end
  end
  describe('#book_id') do
    it('will add an id for a book') do
      test_book = Book.new({:title => 'Outliers', :author => 'Malcolm Gladwell', :book_id => nil})
      expect(test_book.id).to(eq(nil))
    end
  end
end
