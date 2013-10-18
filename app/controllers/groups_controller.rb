class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(params[:group])
    @group.admin_id = current_user.id
       if @group.save
         redirect_to groupadmin_path, notice: 'Die Gruppe wurde erfolgreich angelegt'
       else
         render "new"
        end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update_group
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to groupadmin_path
    else
      render "edit"
    end
  end
  
  
  def index
     @groups = Group.find_all_by_admin_id(current_user.id)
  end
  
  def editmember
    @group = Group.find(params[:id])
    $group = @group
    @member = Member.new
  end
  
  def add_member
    @users = User.all
  end    
  
  def member_update
    @user = User.find_by_email(params[:email])
    if @user
      if $group.users.member? @user
        redirect_to groupadmin_path, notice: "Diese Emailadresse existiert schon in der Gruppe!"
      else
        $group.users << @user 
        redirect_to groupadmin_path 
      end
    else
      redirect_to groupadmin_path, alert: "Diese Emailadresse existiert noch nicht."
    end
   
  end
  
  def remove_member
    @user = User.find(params[:format])
    $group.users.delete @user
    redirect_to groupadmin_path
  end
  
end

