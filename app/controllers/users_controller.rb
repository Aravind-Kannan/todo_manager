class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    render plain: User.find(params[:id]).to_pleasant_string
  end

  def create
    name = params[:name]
    password = params[:password]
    email = params[:email]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "Hey! Your user ID is #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    response_text = User.where("email = ? and password = ?", email, password).first.present?
    render plain: response_text
  end
end
