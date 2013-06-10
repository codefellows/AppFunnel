class UsersController < ApplicationController
  def confirmation
    puts "hi"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    end
  end
end
