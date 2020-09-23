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
  @posts = Post.order 'created_at DESC'
end

get '/' do

	erb :index
end

post '/' do
  p = Post.new params[:post]
  p.save

  erb :index
end
