require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PhotosController do

  # This should return the minimal set of attributes required to create a valid
  # Photo. As you add validations to Photo, be sure to
  # update the return value of this method accordingly.

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhotosController. Be sure to keep this updated too.

  shared_examples("public access to photos") do 
    describe "GET index" do
      it "assigns all photos as @photos" do
        photo = Photo.create! attributes_for(:photo)
        get :index
        assigns(:photos).should eq([photo])
      end
    end

    describe "GET show" do
      it "assigns the requested photo as @photo" do
        photo = Photo.create! attributes_for(:photo)
        get :show, {:id => photo.to_param}
        assigns(:photo).should eq(photo)
      end
    end
  end

  shared_examples("full access to photos") do
    describe "GET new" do
      it "assigns a new photo as @photo" do
        get :new
        assigns(:photo).should be_a_new(Photo)
      end
    end

    describe "GET edit" do
      it "assigns the requested photo as @photo" do
        photo = Photo.create! attributes_for(:photo)
        get :edit, {:id => photo.to_param}
        assigns(:photo).should eq(photo)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Photo" do
          expect {
            post :create, {:photo => attributes_for(:photo)}
          }.to change(Photo, :count).by(1)
        end

        it "assigns a newly created photo as @photo" do
          post :create, {:photo => attributes_for(:photo)}
          assigns(:photo).should be_a(Photo)
          assigns(:photo).should be_persisted
        end

        it "redirects to the created photo" do
          post :create, {:photo => attributes_for(:photo)}
          response.should redirect_to(Photo.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved photo as @photo" do
          # Trigger the behavior that occurs when invalid params are submitted
          Photo.any_instance.stub(:save).and_return(false)
          post :create, {:photo => { "caption" => "invalid value" }}
          assigns(:photo).should be_a_new(Photo)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Photo.any_instance.stub(:save).and_return(false)
          post :create, {:photo => { "caption" => "invalid value" }}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested photo" do
          photo = Photo.create! attributes_for(:photo)
          # Assuming there are no other photos in the database, this
          # specifies that the Photo created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Photo.any_instance.should_receive(:update_attributes).with({ "caption" => "MyString" })
          put :update, {:id => photo.to_param, :photo => { "caption" => "MyString" }}
        end

        it "assigns the requested photo as @photo" do
          photo = Photo.create! attributes_for(:photo) 
          put :update, {:id => photo.to_param, :photo => attributes_for(:photo)}
          assigns(:photo).should eq(photo)
        end

        it "redirects to the photo" do
          photo = Photo.create! attributes_for(:photo)
          put :update, {:id => photo.to_param, :photo => attributes_for(:photo)}
          response.should redirect_to(photo)
        end
      end

      describe "with invalid params" do
        it "assigns the photo as @photo" do
          photo = Photo.create! attributes_for(:photo)
          # Trigger the behavior that occurs when invalid params are submitted
          Photo.any_instance.stub(:save).and_return(false)
          put :update, {:id => photo.to_param, :photo => { "caption" => "invalid value" }}
          assigns(:photo).should eq(photo)
        end

        it "re-renders the 'edit' template" do
          photo = Photo.create! attributes_for(:photo)
          # Trigger the behavior that occurs when invalid params are submitted
          Photo.any_instance.stub(:save).and_return(false)
          put :update, {:id => photo.to_param, :photo => { "caption" => "invalid value" }}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested photo" do
        photo = Photo.create! attributes_for(:photo)
        expect {
          delete :destroy, {:id => photo.to_param}
        }.to change(Photo, :count).by(-1)
      end

      it "redirects to the photos list" do
        photo = Photo.create! attributes_for(:photo)
        delete :destroy, {:id => photo.to_param}
        response.should redirect_to(photos_url)
      end
    end
  end
  
  describe "admin access to photos" do
    before :each do
      user = create(:admin_user)
      sign_in user
    end

    it_behaves_like "public access to photos"
    it_behaves_like "full access to photos"
  end

  describe "guest access to photos" do
    it_behaves_like "public access to photos"

    describe "GET#new" do
      it "requires login" do
        get :new
        response.should redirect_to(new_user_session_url)
      end
    end

    describe "POST#create" do
      it "requires login" do
        post :create, photo: attributes_for(:photo)
        response.should redirect_to(new_user_session_url)
      end
    end

    describe "PUT#update" do
      it "requires login" do
        photo = Photo.create! attributes_for(:photo)
        put :update, {:id => photo.to_param, :photo => { "caption" => "MyString" }}
        response.should redirect_to(new_user_session_url)
      end
    end

    describe "DELETE#destroy" do
      it "requires login" do
        photo = Photo.create! attributes_for(:photo)
        delete :destroy, {:id => photo.to_param, :photo => { "caption" => "MyString" }}
        response.should redirect_to(new_user_session_url)
      end
    end
  end
  
end
