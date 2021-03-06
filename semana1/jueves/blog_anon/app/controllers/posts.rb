get '/post_menu' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :post_menu
end

get "/show_all" do
  @posts = Post.all
  erb :all_posts
end

get "/show_post" do
  erb :one_post
end

post '/show_post' do
  @post_one = params[:id_find]
  redirect to ("/show_post/#{@post_one}")
end

get '/show_post/:id' do
  @spec = Post.where(id: @post_one)
  @spec
end

get "/create_post" do
  erb :create
end

post "/create_post" do
  title  = params[:title]
  body = params[:body]
  tags = params[:tags]

  post = Post.new(title: title, body: body)

  if post.save
    tags.split(",").each do |tag|
      tag = Tag.new(tag: tag.strip)
      if tag.save
      post.postags.create(tag: tag)
      else
        erb :create
      end
    end
    redirect to ("/post_menu")
  else
    erb :create
  end
end

get "/edit_post/:id_post" do
  erb :edit
end

get "/delete_post/:id_post" do
  erb :delete
end