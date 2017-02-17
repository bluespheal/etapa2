get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @all = Url.all
  erb :index
end

post '/urls' do
  @origin = params[:user_url]
  @add = Url.new(original_url: @origin, short_url: @short, counter: 0)
  if @add.save
    redirect to ("/")
  else
    @all = Url.all
    erb :index
  end
end

# e.g., /q6bda
get '/short_url/:id' do
  @url = Url.find_by(id: params[:id])
  @url.increment!(:counter, by = 1)

  redirect to ("/")
  # redirige a la URL original
end

