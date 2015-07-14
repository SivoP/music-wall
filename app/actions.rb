# Homepage (Root path)
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