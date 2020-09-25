#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'leprosorium.db' }

class Post < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :content, presence: true, length: { minimum: 10, maximum: 200 }
end

class Comment < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :content, presence: true, length: { minimum: 10, maximum: 200 }
end

before do
  @posts = Post.order 'created_at DESC'
  @comment = Comment.order 'created_at DESC'
end

get '/' do

	erb :index
end

post '/' do
  p = Post.new params[:post]
  
  if !p.save

    @error = p.errors.full_messages.first
  
  end

  erb :index
end

get '/post/:id' do
  @post_id = params[:id]
  @post = Post.find(@post_id)

  erb :post
end

post '/post/:id' do
  @post_id = params[:id]
  @post = Post.find(@post_id)

  comments = Comment.new params[:com]
  if !comments.save
    @error = comments.errors.full_messages.first
  end

  erb :post
end

