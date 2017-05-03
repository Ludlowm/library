require 'sinatra'
require 'sinatra/reloader'
require './lib/library'
require 'pry'

also_reload('lib/**/*.rb')

get ('/') do
  erb (:index)
end

get ('/librarian') do
  erb (:book_form)
end

post('/books') do
  Library::Book.add(params.fetch('title'), params.fetch('author'))
  erb (:book_list)
end

  get('/book/:id') do

  erb :book
end
