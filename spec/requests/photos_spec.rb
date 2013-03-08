require 'spec_helper'

describe "Photos" do
  describe "GET /album/1/photos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get album_photos_path( create(:album).to_param)
      response.status.should be(200)
    end
  end
end
