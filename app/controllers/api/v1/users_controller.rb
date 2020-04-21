class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      user_message = FailedUser.new(user)
      render json: FailedSerializer.new(user_message), status: 401
    end
  end

  def user_params
   params.permit(:email, :password, :password_confirmation)
  end
end
