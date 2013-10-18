class MembersController < ApplicationController

 def new
    @member = Member.new
    @users = User.all
  end

  def create
    @user = User.find(params[:email])
    @member = Member.create(params[:group_id, :@user.id])
       if @member.save
         redirect_to editmember_path
       else
         render "new"
        end
  end

  
  def index
     @memberg = Member.find_all_by_group_id(@group.id)
  end


end
