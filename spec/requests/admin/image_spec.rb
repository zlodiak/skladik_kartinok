require 'rails_helper'
require 'helpers/application_helper_spec'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe "admin::Images", type: :request do
  describe "return 200 status code for GET /admin/images" do
    

    it "#index" do     
      get admin_images_path
      expect(response).to have_http_status(200)
    end
=begin
    it "#show" do
      @image = FactoryGirl.create(:image)  
      get admin_image_path(@image)
      expect(response).to have_http_status(200)
    end   

    it "#new" do
      get new_admin_image_path
      expect(response).to have_http_status(200)
    end   
=end

  end
end

