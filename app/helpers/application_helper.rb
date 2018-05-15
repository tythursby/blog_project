module ApplicationHelper

  def not_owner(current_user, post_user)
    unless current_user.id == post_user.user_id
      redirect_to root_path
    end
  end

end
