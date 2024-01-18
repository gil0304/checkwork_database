require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

enable :sessions

get '/' do
  if session[:category]
    @members = Member.where(session[:category])
  else
    @members = Member.all
  end
  erb :index
end

post '/new' do
  Member.create(
    name: params[:name],
    course: params[:course],
    age: params[:age]
  )
  session.delete(:category)
  redirect '/'
end

post '/category' do
  conditions = {}

  unless params[:name].empty?
    conditions[:name] = params[:name]
  end

  unless params[:course] == "----"
    conditions[:course] = params[:course]
  end

  unless params[:age].empty?
    conditions[:age] = params[:age]
  end
  
  session[:category] = conditions
  
  redirect '/'
end
