require 'sinatra/base'
require_relative './lib/bookmark'
# require_relative 'lib/game'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  run! if app_file == $0
end
