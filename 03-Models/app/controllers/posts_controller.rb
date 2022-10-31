require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    posts = Post.all
    # TODO: give them to the view to be printed
    @view.display(posts)
  end

  def create
    title = @view.ask_for(:title)
    url = @view.ask_for(:url)
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    posts = Post.all
    @view.display(posts)
    id = @view.ask_for(:id).to_i
    post = Post.find(id)
    title = @view.ask_for(:title)
    url = @view.ask_for(:url)
    post.title = title
    post.url = url
    post.save
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    posts = Post.all
    @view.display(posts)
    id = @view.ask_for(:id).to_i
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    posts = Post.all
    @view.display(posts)
    id = @view.ask_for(:id).to_i
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
