module Api
  module V1
    class AuthenticationsController < ApplicationController
      before_action :set_user, only: [:create, :update]
      before_action :set_authentication, only: [:show, :update, :destroy]

      # GET /authentications
      def index
        @authentications = Authentication.all

        render json: @authentications
      end

      # GET /authentications/1
      def show
        render json: @authentication
      end

      # POST /authentications
      def create
        @authentication = Authentication.new(authentication_params)

        if @authentication.save
          render json: @authentication, status: :created, location: @authentication
        else
          render json: @authentication.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /authentications/1
      def update
        if @authentication.update(authentication_params)
          render json: @authentication
        else
          render json: @authentication.errors, status: :unprocessable_entity
        end
      end

      # DELETE /authentications/1
      def destroy
        @authentication.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_authentication
          @authentication = Authentication.find(params[:id])
        end

        def set_user
          @user = User.find(params[:user_id])
        end

        # Only allow a list of trusted parameters through.
        def authentication_params
          params.require(:authentication).permit(:user_id)
        end
    end
  end
end
