class UsersController < ApplicationController

  def show
    @user  = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id]).order("studied_at desc")
    study_time_total = Post.where(user_id: params[:id]).sum(:study_time) * 60
    study_minutes_total = Post.where(user_id: params[:id]).sum(:study_minutes)
    @study_total = ((study_time_total + study_minutes_total) / 60.to_f).round(1)
    gon.posts = Post.where(user_id: params[:id])
  end

private

end
