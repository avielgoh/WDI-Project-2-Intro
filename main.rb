require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

# PostgreSQL database links
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/industry'
require_relative 'models/interest'
require_relative 'models/location'
require_relative 'models/connection'

enable :sessions # for the purposes of the user password

# close connection with ActiveRecord
after do
  ActiveRecord::Base.connection.close
end

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user # returns back a boolean
  end

end


get '/' do
  erb :index
end

get '/signup' do
  @locations = Location.all
  @industries = Industry.all

  erb :signup
end

post '/signup/register' do

  @user = User.new
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.linkedin_url = params[:linkedin_url]
  @user.personal_url = params[:personal_url]
  @user.current_industry = params[:current_industry]
  @user.location_id = params[:location]
  @user.accept_terms = params[:accept_terms]
  @user.save

  redirect to '/signup/preferences'
end

get '/signup/preferences' do

  @industries = Industry.all

  erb :preferences
end

# ----- AUTHENTICATION -----

get '/login' do
  erb :login
end

# creating a session
post '/session' do

  user = User.find_by(email: params[:email]) # identify user by email address

  if user && user.authenticate(params[:password]) # if find user and correct password
    # yay
    # create the session
    session[:user_id] = user.id
    redirect to '/dashboard'
  else
    redirect to '/login'
  end

end

# logout
delete '/session' do
  # clear session
  session[:user_id] = nil
  redirect to '/'
end

get '/dashboard' do
  redirect to '/login' unless logged_in?

  @user = User.find_by(id: session[:user_id])
  @location = @user.location

  erb :dashboard
end

get '/profile/edit' do
  redirect to '/login' unless logged_in?
  @user = User.find_by(id: session[:user_id])
  @locations = Location.all
  @industries = Industry.all
  @interests = Interest.all

  erb :profile
end

post '/profile/update' do
  redirect to '/login' unless logged_in?
  @user = User.find_by(id: session[:user_id])
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  @user.linkedin_url = params[:linkedin_url]
  @user.personal_url = params[:personal_url]
  @user.current_industry = params[:current_industry]
  @user.location_id = params[:location]
  @user.save
  redirect to 'profile/edit'
end

get '/admin/settings' do
  @user = User.find_by(id: session[:user_id])
  @locations = Location.all
  @industries = Industry.all
  @interests = Interest.all
  erb :admin_settings
end

post '/admin/settings/edit_location' do
  @location = Location.new
  @location.city = params[:city]
  @location.country = params[:country]
  @location.save
  redirect to '/admin/settings'
end

delete '/admin/settings/edit_location' do
  Location.find(params[:location]).destroy

  redirect to '/admin/settings'
end

post '/admin/settings/edit_industry' do
  @industry = Industry.new
  @industry.name = params[:industry]
  @industry.save
  redirect to '/admin/settings'
end

delete '/admin/settings/edit_industry' do
  Industry.find_by(name: params[:industry]).destroy

  redirect to '/admin/settings'
end

get '/admin/dashboard' do
  @user = User.find_by(id: session[:user_id])
  @locations = Location.all
  @industries = Industry.all
  @interests = Interest.all
  erb :admin_dashboard
end

get '/fixup' do

  @user = User.find_by(id: session[:user_id])
  @locations = Location.all
  @industries = Industry.all
  @interests = Interest.all
  erb :fixup
end

get '/faq' do
  erb :faq
end

get '/linkedin' do
  erb :linkedin
end

get '/feed' do
  erb :feed
end

get '/about' do
  erb :about
end
