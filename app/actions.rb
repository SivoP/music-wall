# Homepage (Root path)

configure do 
  enable :sessions
  # set :email, params[:email]
  # set :password, params[:password] 
end


get '/' do
  erb :index
end



get '/tracks/?' do
 @tracks = Track.all
 erb :'tracks'
end

get '/tracks/new' do
  erb :'new_track'
end


post '/tracks' do
  # binding.pry
  @track = Track.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url])
  if @track.save
    redirect '/tracks'
  else
    erb :'new_track'
  end 
end

get '/tracks/loggedin/?' do  
  @tracks = Track.all
  erb :'tracks_logged_in'
end

get '/login' do 
  erb :login
end



post '/login' do 
  @user = User.find_by(email: params[:email]) 
  if @user.password == params[:password]
    redirect '/tracks/loggedin'
    session[:user_id] = user.id
  else
    erb :login
  end
end


get '/logout' do 
  session.clear
  redirect '/tracks'
end






