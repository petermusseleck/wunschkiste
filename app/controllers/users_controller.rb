class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_path,
        notice: "Das Benutzerkonto wurde angelegt!"
    else
      render "new"
    end
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
  def remove_user
  	
  end
  
  def pwchange
    @user = User.find_by_id(current_user.id)
  end
  
  def update
    @user =  User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to admin_path
    else
      render "pwchange"
    end
  end
  
  def delete
    @user = User.find(params[:id])
    @requests = Request.find_all_by_user_id(params[:id])  
    @requests.each do |request|
      request.destroy
    end
    @fulfilrequests = Request.find_all_by_fulfilid(params[:id])
    @fulfilrequests.each do |fulfilrequest|
      fulfilrequest.taken = nil
      fulfilrequest.fulfilid = nil
      fulfilrequest.update_attributes(params[:fulfilrequest])
    end
    @user.destroy
      redirect_to userindex_url
  
  end
  
  def index
    @users = User.all
    @users.delete current_user
  end
  

end
