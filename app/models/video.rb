class Video < ActiveRecord::Base
  has_attached_file :video, 
                    :styles => {
                      :medium => { :geometry => "640x480", :format => 'flv' },
                      :thumb => { :geometry => "200x100#", :format => 'jpg', :time => 10 }
                    }, :processors => [:transcoder] 
  validates_attachment_content_type :video, :content_type => [
      "video/mp4", 
      "video/flv", 
      "video.3gp", 
      "video.mov", 
      "video/mpeg", 
      "video/mpeg4", 
      "image/jpg", 
      "image/jpeg"
    ]
end
