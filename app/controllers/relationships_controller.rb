class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    relationship =  Relationship.create(create_params)
    redirect_to user_path(id: relationship[:following_id])
  end

  def destroy
    relationship =  Relationship.find(params[:id])
    relationship.destroy
    redirect_to user_path(id: relationship[:following_id])
  end

  private
  def create_params
    params.permit(:following_id).merge(follower_id: current_user.id)
  end
end
