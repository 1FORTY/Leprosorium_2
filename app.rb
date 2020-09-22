#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'leprosorium.db' }

class Post < ActiveRecord::Base

end

class Comment < ActiveRecord::Base

end

before do
  @posts = Post.all
end

get '/' do
	erb :index
end

post '/' do
  @posts = Post.new params[:post]
  @posts.save

  erb :index
end
