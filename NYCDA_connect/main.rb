# inside of your main.rb file
# require the necessary libs
require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:test.sqlite3"
require 'bundler/setup'
require 'sinatra/base'
require 'rack-flash'

enable :sessions
use Rack::Flash, :sweep => true
set :sessions => true
require_relative './models'

get'/' do
	@user=User.all
	erb :Userform
end

post '/UserCrendentialsSave' do
	User.create(fname:params[:username],lname:params[:username],email:params[:email],username:params[:username],password:params[:password])
	redirect '/'
end

post '/UserCrendentialsValidation' do
 @user = User.where(params[:username]).first
  if @user && @user.password == params[:password]
    flash[:notice] = "You've successfully signed in."

    
    session[:user_id] = @user.id
    redirect '/user'
  else
   flash[:alert] = "Sorry, that user doesn't exist. Feel free to sign up."
   redirect '/'
  end	
end
get'/user' do
		erb :user
end