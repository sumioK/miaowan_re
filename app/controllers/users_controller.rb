class UsersController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user,{only:[:edit, :update, :index, :show]}
  before_action :ensure_correct_user,{only:[:edit, :update, :delete]}
  before_action :forbid_login_user,{only:[:new, :create, :login_form, :login]}
  def new
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      profiel_image: "default_user.jpg"
    )
      if params[:password] == params[:password2] && @user.save
        session[:user_id] = @user.id
        flash[:notice] ="Success sign up!"
        redirect_to("/posts/index")
      else
        render("users/new")
      end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
    @likes = Like.where(user_id: @user.id)
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id

      flash[:notice] = "Login success"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logout success"
    redirect_to("/login")
  end

  def index
    @users = User.where.not(id: @current_user).order(name: :DESC)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.introduction = params[:introduction]

    if params[:profiel_image]
      @user.profiel_image = "#{@user.id}.jpg"
      image = params[:profiel_image]
      File.binwrite("public/user_images/#{@user.profiel_image}" , params[:profiel_image].read)
    end

    if @user.save
      flash[:notice] = "編集が完了しました!"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def delete
    @user = User.find_by(id: @current_user.id)
    @user.destroy
    redirect_to ("/")
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end
  
  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @current_user != @user
      flash[:notice] = "権限がありません"
      redirect_to request.referrer || "/posts/index"
    end
  end

end
