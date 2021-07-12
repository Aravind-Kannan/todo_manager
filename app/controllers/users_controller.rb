class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    render plain: User.find(params[:id]).to_pleasant_string
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if !user.save
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    else
      session[:current_user_id] = user.id
      redirect_to "/"
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    response_text = User.where("email = ? and password = ?", email, password).first.present?
    render plain: response_text
  end
end
