class UsersController < ApplicationController
    before_action :logged_in_redirect, except: [:show]
    before_action :require_user, only: [:show]
    before_action :set_user, only: [:show]

    def show
        @messages = @user.messages.order(:created_at)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to MessageMe #{@user.username}, you have successfully signed up"
            redirect_to root_path
        else
            flash.now[:error] = "There was something wrong with your signup information"
            render 'new'
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
end