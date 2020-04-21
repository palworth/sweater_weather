class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      login_sucsess(user)
    else
       login_failed
     end
  end

private

  def login_sucsess(user)
    render json: UserSerializer.new(user), status: 201
  end

  def login_failed
    render json: { failed: 'Please check username and password. Login Failed' }, status: 401
  end
end
