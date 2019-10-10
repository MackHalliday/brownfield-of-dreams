# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    if current_user.github_token?
      facade = GithubRepoFacade.new(current_user)
      @repos = facade.repo_data
      @following = GithubFollowingFacade.new(current_user).following_data
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
