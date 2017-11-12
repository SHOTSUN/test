class StaticController < ApplicationController
	def index
	end


	def dest
    @user = User.find(params[:id]).destroy
    redirect_to user_session_url
  end

  def block
  	User.find(params[:id]).update_attribute(:ban, true)
    redirect_to user_session_url
  end

  def unblock
    User.find(params[:id]).update_attribute(:ban, false)
    redirect_to user_session_url
  end


  def welcome
    redirect_to user_session_url
  end

end
