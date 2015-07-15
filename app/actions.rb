# Homepage (Root path)

configure do 
  enable :sessions
  
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

get '/login' do 
  erb :login
end


post '/login' do 
  user = User.find_by(email: params[:email]) 
  if user.password == params[:password]
    redirect '/tracks'
  #   session[:user_id] = user.id
  else
    erb :login
  end
end





