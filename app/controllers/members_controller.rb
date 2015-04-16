class MembersController < ApplicationController
  # before_action current_user.status == 99 # 只允许管理员进入
  before_action :set_member, only: [:show, :edit, :update]
  def index
    @members = User.where("group_id = ? ",current_user.branch.id)
  end
  def show
  end
  def edit
    @branches = Branch.where("admin_id = ? ",current_user.id ).collect{|c|[c.branchname,c.id]}
  end
  def update
    if member_params[:status] == 99
      @member.update(member_params)
      @member.update(status: 1) # 一旦被主管设置了所属网点号，把用户的status设置为1，让用户不能再变更group_id
      redirect_to :action => :index
    else
      redirect_to members_path, :flash => {:notice => "你无权设置一级管理员～"}
    end
  end

  private

    def set_member
      @member = User.find(params[:id])
    end

    def member_params
      params.require(:user).permit(:username,:branch_id,:status)
    end
end
