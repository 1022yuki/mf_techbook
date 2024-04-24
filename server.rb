require 'sinatra'
require 'json'
require_relative 'app/infrastructure/database/sqlite'
require_relative 'app/infrastructure/repository/book_repository_impl'
require_relative 'app/usecase/add_book'
require_relative 'app/usecase/list_books'
require_relative 'app/usecase/remove_book'
require_relative 'app/controller/books_controller'

class BookApp < Sinatra::Base
  
  set :bind, '0.0.0.0'
  set :port, 8000

  configure do
    set :db, App::SQLite.new_db
    set :book_repository, App::Repository::BookRepositoryImpl.new(settings.db)
    set :add_book_use_case, App::UseCase::AddBook.new(settings.book_repository)
    set :list_books_use_case, App::UseCase::ListBooks.new(settings.book_repository)
    set :remove_book_use_case, App::UseCase::RemoveBook.new(settings.book_repository)
    set :books_controller, App::Controller::BooksController.new(settings.add_book_use_case, settings.list_books_use_case, settings.remove_book_use_case)
  end

  post '/books' do
    params = JSON.parse(request.body.read)
    response = settings.books_controller.add_book(params)
    status 201
    body response
  end
  
  get '/books' do
    response = settings.books_controller.list_books
    status 200
    body response
  end
  
  delete '/books/:id' do
    response = settings.books_controller.remove_book(params["id"])
    status 200
    body response
  end

  run! if app_file == $0
end
