# REMOVE FOR DEPLOYMENT
# require 'sinatra/reloader'
# require 'pry'
# ----------------------
require 'sinatra'
require 'pg'

# PostgreSQL database links
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/industry'
require_relative 'models/industry_user'
require_relative 'models/location'
require_relative 'models/introduction'

enable :sessions # keep track of user when logged in

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

  def all_information
    @locations = Location.all
    @industries = Industry.all
    @all_users = User.all
    @introduction = Introduction.all
  end

end

# HOME PAGE
get '/' do
  erb :index
end

# ----- REGISTRATION -----

# SIGN UP PAGE
get '/signup' do
  # get info for drop down fields
  all_information # call helper

  # redirect user to their dashboard if logged in
  if logged_in?
    redirect to '/dashboard'
  end

  erb :signup
end

# save information of new registration
post '/signup' do
  # save details of new user from params
  @user = User.new
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.linkedin_url = params[:linkedin_url]
  @user.personal_url = params[:personal_url]
  @user.industry_id = params[:current_industry]
  @user.location_id = params[:location]
  @user.save

  # save interested industries of new user from checkboxes
  @interests =  params[:interested_industries][:preferences]
  @interests.each do |industry_id|
    @user.interested_industries << Industry.find(industry_id)
  end

  redirect to '/login'
end

# --- AUTHENTICATION ---

# LOGIN PAGE
get '/login' do
  # get info for drop down fields
  all_information # call helper

  # redirect user to their dashboard if logged in
  if logged_in?
    redirect to '/dashboard'
  end

  erb :login
end

# create new user session
post '/session' do
  user = User.find_by(email: params[:email]) # identify user by email address

  # create new session if user and password match
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/dashboard'
  else
    redirect to '/login'
  end
end

# delete session when user logs out
delete '/session' do
  session[:user_id] = nil
  redirect to '/'
end

# --- USER PAGES ---

# display user dashboard
get '/dashboard' do
  redirect to '/login' unless logged_in? # redirect to login if not logged in

  all_information # call helper
  @user = User.find_by(id: session[:user_id])
  @location = @user.location

  erb :dashboard
end

# give connection a good rating
post '/dashboard/thumbs_up' do
  @connection_id = params[:connection_id].to_i
  @introduction = Introduction.find(@connection_id)
  @introduction.rating = true
  @introduction.save

  redirect to '/dashboard'
end

# give connection a bad rating
post '/dashboard/thumbs_down' do
  @connection_id = params[:connection_id].to_i
  @introduction = Introduction.find(@connection_id)

  @introduction.rating = false
  @introduction.save

  redirect to '/dashboard'
end

# display edit profile
get '/profile/edit' do
  redirect to '/login' unless logged_in?

  all_information # call helper
  @user = User.find_by(id: session[:user_id])

  erb :profile
end

# update user profile
post '/profile/update' do
  redirect to '/login' unless logged_in?
  @user = User.find_by(id: session[:user_id])
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  @user.linkedin_url = params[:linkedin_url]
  @user.personal_url = params[:personal_url]
  @user.industry_id = params[:current_industry]
  @user.location_id = params[:location]
  @user.save

  # only add interest if not previously an interest
  @interests =  params[:interested_industries][:preferences]
  @interests.each do |industry_id|
    @user.interested_industries << Industry.find(industry_id) unless @user.interested_industries.include? (Industry.find(industry_id))
  end

  redirect to '/dashboard'
end

# unsubscribe and delete user
delete '/unsubscribe' do
  all_information # call helper
  @user = User.find_by(id: session[:user_id])
  @email = params[:email]

  # user must confirm email before unsubscribing
  if @user.email == @email
    @introduction.each do |intro|
      if intro.user_id == @user.id.to_i || intro.connection_id == @user.id.to_i
        intro.destroy
      end
    end
    @user.destroy
    redirect to '/'
  else
    redirect to '/dashboard'
  end

end


# --- ADMINISTRATOR PAGES ---

# display settings
get '/admin/settings' do
  all_information # call helper
  @user = User.find_by(id: session[:user_id])
  erb :admin_settings
end

# create new locations
post '/admin/settings/edit_location' do
  @location = Location.new
  @location.city = params[:city]
  @location.country = params[:country]
  @location.save
  redirect to '/admin/settings'
end

# delete location
delete '/admin/settings/edit_location' do
  Location.find(params[:location]).destroy
  redirect to '/admin/settings'
end

# create new industry
post '/admin/settings/edit_industry' do
  @industry = Industry.new
  @industry.name = params[:industry]
  @industry.save
  redirect to '/admin/settings'
end

# delete industry
delete '/admin/settings/edit_industry' do
  Industry.find_by(name: params[:industry]).destroy
  redirect to '/admin/settings'
end

# display introductions dashboard
get '/admin/dashboard' do
  all_information # call helper
  @user = User.find_by(id: session[:user_id])

  @potential_introductions = []
  @selection = "Select a user"

  erb :admin_dashboard
end

# initiate by user
post '/admin/search' do
  @selected_user = params[:selected_user]
  redirect to "/admin/search/#{ @selected_user }"
end

# return potential introductions for user selected
get '/admin/search/:user_id' do
  @user_id = params[:user_id].to_i
  @selection = "#{ User.find(@user_id).first_name } #{ User.find(@user_id).last_name }"

  # get industries the selected user is interested in
  @interested_industries = [] # array of industry id's
  User.find(@user_id).interested_industries.each do |industry|
    @interested_industries << industry.id
  end

  # get users in the industries the selected user is interested in
  @interested_industries_users = [] # array of user id's
  @interested_industries.each do |id|
    Industry.find(id).interested_users.each do |user|
      @interested_industries_users << user.id
    end
  end

  # filter for unique id's and id of the selected user
  @distinct_interested_industries_users = []
  @interested_industries_users.uniq.each do |id|
    if id != @user_id
      @distinct_interested_industries_users << id
    end
  end

  # check that users are interested in the industry the selected user is in
  @potential_introductions = []
  @distinct_interested_industries_users.each do |id|
    User.find(id).interested_industries.each do |industry|
      if industry.id == @user_id
        @potential_introductions << id
      end
    end
  end

  erb :admin_dashboard
end

# get '/admin/introduction/:user_id' do
#   @user_id = params[:user_id].to_i
#   @connection_id = params[:introduce_user].to_i
#
#   erb :admin_dashboard
# end

# create a new introduction
post '/admin/introduction' do
  @selected_user = params[:current_user].to_i

  # log introduction of current user to introduce user
  @introduction = Introduction.new
  @introduction.user_id = params[:current_user].to_i
  @introduction.connection_id = params[:introduce_user].to_i
  @introduction.save

  # log introduction of current user to introduce user
  @introduction = Introduction.new
  @introduction.user_id = params[:introduce_user].to_i
  @introduction.connection_id = params[:current_user].to_i
  @introduction.save

  redirect to "/admin/dashboard"
end

# PAGE STILL TO BE CREATED
get '/faq' do
  erb :faq
end
