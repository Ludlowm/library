require "library"
require "rspec"
require "pry"
require "pg"
require "spec_helper"

describe Library do

  describe Library::Book do

    describe 'Library::Book.all' do
      it 'returns an empty array' do
        expect(Library::Book.all.to_a).to eq([])
      end
    end

    describe 'Library::Book.add' do
      it 'Adds a new book to the database' do
      expect(Library::Book.add('Outliers', 'Malcolm Gladwell')[0]["id"]).to match(UUID_MATCHER)
      end
    end

    describe 'Library::Book.find_by' do
      it 'finds a book based off parameters' do
        id = Library::Book.add('Outliers', 'Malcolm Gladwell').getvalue(0,0)
        Library::Book.add('Fahrenheit 451', 'Ray Bradbury').getvalue(0,0)
        Library::Book.add('Catcher in the Rye', 'J.D. Salinger').getvalue(0,0)
        expect(result = Library::Book.find_by('id', id)).to be_a(Array)
        expect(result = Library::Book.find_by('title', 'title')).to be_a(Array)
        expect(result = Library::Book.find_by('author', 'author')).to be_a(Array)
      end
    end

    describe 'Library::Book.delete' do
      it 'deletes a book from the database' do
        id = Library::Book.add('Outliers', 'Malcolm Gladwell').getvalue(0,0)
        result = Library::Book.delete(id)
        expect(result.result_status).to eq(PG::PGRES_COMMAND_OK)
      end
    end

  end
end
