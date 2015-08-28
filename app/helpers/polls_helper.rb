module PollsHelper
  def get_summary_votes_for_image(image_id)
    likes_summary = ImageLike.where(image_id: image_id).count()
  end  
end
