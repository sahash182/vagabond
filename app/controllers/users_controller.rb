class UsersController < ApplicationController
  def new

  	@user = User.new
  	render :new

  end

  def show
    @city_list = []
    @temp_city ={}
  	# @current_user = User.find(session[:user_id])    
    @current_user = User.find(params[:id]) 
    render :show
  end

  def create
  	# if current_user
   #    redirect_to profile_path
   #  else
   user = User.new(user_params)


   if user.save
    session[:user_id] = user.id
    redirect_to user_path(user)
   else
    # if user_params[:username] == "" ||
    #    user_params[:email] == "" ||
    #    user_params[:password] == "" 
    #    flash[:errorName] = "Please fill in username, email and password."
    # end
    # user.errors.full_messages.each do |m|
    #   flash[:error] = m
    # end
    flash[:error] =  user.errors.full_messages
    redirect_to signup_path

  end
  	# end
  end

  def edit
    @user = User.find(params[:id])
    render :edit    
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to profile_path

  end


  private 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end	



end
