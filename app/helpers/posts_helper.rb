module PostsHelper
  def current_user?(user)
    user == current_user.id
  end
end
