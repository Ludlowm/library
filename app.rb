require 'sinatra'
require 'sinatra/reloader'
require './lib/library'
require 'pry'

also_reload('lib/**/*.rb')

get '/' do
  erb :index
end

get '/librarian' do
  erb :book_form
end

get '/books' do
  erb :book_list
end

post '/books' do
  Library::Book.add(params['title'], params['author'])
  erb :book_list
end

get '/book/:id' do
 @book = Library::Book.find_by('id', params['id'])
  erb :book
end

get '/book/:id/update' do
  @book = Library::Book.find_by('id', params['id'])
  erb :update_book
end

patch '/book/:id' do
  Library::Book.update('title', params['updated-title'], "id = '#{params['id']}'")
  @book = Library::Book.find_by('id', params['id'])
  erb :book
end

get '/book/:id/delete' do
  @book = Library::Book.find_by('id', params['id'])
  erb :delete_book
end

delete '/book/:id' do
  Library::Book.delete("#{params['id']}")
  @book = Library::Book.find_by('id', params['id'])
erb :book_list
end




# get '/librarian/:find_by' do
#   Library::Book.find_by(params.fetch('find-title'), params.fetch('find-author'))
#   erb :book_form
#
# end
