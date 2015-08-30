module PollsHelper
  def get_summary_votes_for_image(image_id)
    likes_summary = ImageLike.where(image_id: image_id).count()
  end  

  def user_vote_image_check(image_id)
    return true if !user_signed_in?
    
    user_is_vote = ImageLike.where(image_id: image_id, user_id: current_user.id).count()

    if user_is_vote == 0
      return nil
    else
      return true
    end
  end
end
