require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

# PostgreSQL database links
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/industry'
require_relative 'models/connection'

enable :sessions # for the purposes of the user password

# close connection with ActiveRecord
after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :index
end

get '/users/register' do
  erb :register
end

get '/users/login' do
  erb :login
end

get '/faq' do
  erb :faq
end

get '/feed' do
  erb :feed
end

get '/profile/:user' do
  erb :profile
end

get '/about' do
  erb :about
end
