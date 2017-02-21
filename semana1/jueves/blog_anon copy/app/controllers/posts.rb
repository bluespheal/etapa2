get '/post_menu' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :post_menu
end

get "/show_all" do
  @posts = Posts.all
  erb :all_posts
end

get "/show_post/:id_post" do
  erb :one_post
end

get "/create_post" do
  erb :create
end

post "/create_post" do
  title  = params[:title]
  body = params[:body]
  tags = params[:tags]

  @post = Posts.new(title: title, body: body)

  if @post.save
    tags.split(",").each do |tag|

      tag = Tags.create(tag: tag.strip)

      @post.posts_tags.create(tag: tag)

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