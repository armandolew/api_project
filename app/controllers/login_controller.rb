class LoginController < ApplicationController
  def login
    params.require(:email)
    params.require(:password)

    user = User.find_by!(email: params[:email])
    if user.authenticate(params[:password])
      authentication = user.authentications.new
      authentication.save!

      render json: {
        message: authentication.token
      }, status: 201
    else
      render json: {
        message: 'Bad username/password combination'
      }, status: 401
    end
  end
end
