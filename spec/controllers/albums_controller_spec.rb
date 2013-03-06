require 'spec_helper'

describe AlbumsController do

  def valid_attributes
    { "title" => "MyString" }
  end

  def valid_session
    {}
  end

  shared_examples("public access to albums") do
    describe "GET index" do
      it "assigns all albums as @albums" do
        album = Album.create! attributes_for(:album)
        get :index, {}, valid_session
        assigns(:albums).should eq([album])
      end
    end

    describe "GET show" do
      it "assigns the requested album as @album" do
        album = Album.create! attributes_for(:album)
        get :show, {:id => album.to_param}, valid_session
        assigns(:album).should eq(album)
      end
    end
  end

  describe "guest access" do
    it_behaves_like "public access to albums"
  end

  shared_examples("full access to albums") do
    describe "GET new" do
      it "assigns a new album as @album" do
        get :new, {}, valid_session
        assigns(:album).should be_a_new(Album)
      end
    end

    describe "GET edit" do
      it "assigns the requested album as @album" do
        album = Album.create! attributes_for(:album)
        get :edit, {:id => album.to_param}, valid_session
        assigns(:album).should eq(album)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Album" do
          expect {
            post :create, {:album => attributes_for(:album)}, valid_session
          }.to change(Album, :count).by(1)
        end

        it "assigns a newly created album as @album" do
          post :create, {:album => attributes_for(:album)}, valid_session
          assigns(:album).should be_a(Album)
          assigns(:album).should be_persisted
        end

        it "redirects to the created album" do
          post :create, {:album => attributes_for(:album)}, valid_session
          response.should redirect_to(Album.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved album as @album" do
          # Trigger the behavior that occurs when invalid params are submitted
          Album.any_instance.stub(:save).and_return(false)
          post :create, {:album => { "title" => "invalid value" }}, valid_session
          assigns(:album).should be_a_new(Album)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Album.any_instance.stub(:save).and_return(false)
          post :create, {:album => { "title" => "invalid value" }}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested album" do
          album = Album.create! attributes_for(:album)
          # Assuming there are no other albums in the database, this
          # specifies that the Album created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Album.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
          put :update, {:id => album.to_param, :album => { "title" => "MyString" }}, valid_session
        end

        it "assigns the requested album as @album" do
          album = Album.create! attributes_for(:album)
          put :update, {:id => album.to_param, :album => attributes_for(:album)}, valid_session
          assigns(:album).should eq(album)
        end

        it "redirects to the album" do
          album = Album.create! attributes_for(:album)
          put :update, {:id => album.to_param, :album => valid_attributes}, valid_session
          response.should redirect_to(album)
        end
      end

      describe "with invalid params" do
        it "assigns the album as @album" do
          album = Album.create! attributes_for(:album)
          # Trigger the behavior that occurs when invalid params are submitted
          Album.any_instance.stub(:save).and_return(false)
          put :update, {:id => album.to_param, :album => { "title" => "invalid value" }}, valid_session
          assigns(:album).should eq(album)
        end

        it "re-renders the 'edit' template" do
          album = Album.create! attributes_for(:album)
          # Trigger the behavior that occurs when invalid params are submitted
          Album.any_instance.stub(:save).and_return(false)
          put :update, {:id => album.to_param, :album => { "title" => "invalid value" }}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested album" do
        album = Album.create! attributes_for(:album)
        expect {
          delete :destroy, {:id => album.to_param}, valid_session
        }.to change(Album, :count).by(-1)
      end

      it "redirects to the albums list" do
        album = Album.create! attributes_for(:album)
        delete :destroy, {:id => album.to_param}, valid_session
        response.should redirect_to(albums_url)
      end
    end
  end

  describe "admin access to albums" do
    before :each do
      sign_in create(:admin_user)
    end

    it_behaves_like "public access to albums"
    it_behaves_like "full access to albums"
  end

  describe "guest access to albums" do
    it_behaves_like "public access to albums"
    
    describe "GET#new" do
      it "requires login" do
        get :new
        response.should redirect_to(new_user_session_url)
      end
    end

    describe "POST#create" do
      it "requires login"
    end

    describe "PUT#update" do
      it "requires login"
    end

    describe "DELETE#destroy" do
      it "requires login"
    end
  end


end
