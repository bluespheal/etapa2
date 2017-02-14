require 'sinatra'
require "sinatra/activerecord"
require './models/user.rb'


set :database, {adapter: "sqlite3", database: "db/users.sqlite3", pool: 30}

get '/' do
  erb :index
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get '/users' do
  @users = User.all
  erb :users
end