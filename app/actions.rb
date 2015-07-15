# Homepage (Root path)

configure do 
  enable :sessions
end


get '/' do
  erb :index
end

get '/signup' do 
  erb :signup
end

post '/signup' do 
  @user = User.create(
    email: params[:email],
    password: params[:password]
    )
  redirect '/login'
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
    url: params[:url],
    user_id: session[:user_id])
  if @track.save
    redirect '/tracks'
  else
    erb :'new_track'
  end 
end

get '/tracks/?' do  
  @tracks = Track.all
  erb :'tracks'
end

get '/login' do 
  erb :login
end



post '/login' do 
  @user = User.find_by(email: params[:email]) 
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/tracks/?'
  else
    erb :login
  end
end


get '/logout' do 
  session.clear
  redirect '/tracks'
end
