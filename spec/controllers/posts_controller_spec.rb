require 'spec_helper'

describe PostsController do

  describe "GET index" do
    it "assigns all posts as @posts" do
      post_1 = FactoryGirl.create :post, title: "Post 1"
      post_2 = FactoryGirl.create :post, title: "Post 2"
      post_3 = FactoryGirl.create :post, title: "Post 3"
      get :index
      expect(assigns(:posts)).to eq([post_1, post_2, post_3])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = FactoryGirl.create :post
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe "POST create" do
    describe "when signed in" do
      login_user
      describe "with valid params" do
        it "creates a new Post" do
          expect {
            post :create, post: FactoryGirl.attributes_for(:post)
          }.to change(Post, :count).by(1)
        end

        it "assigns a newly created post as @post" do
          post :create, post: FactoryGirl.attributes_for(:post)
          expect(assigns(:post)).to be_a(Post)
          expect(assigns(:post)).to be_persisted
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved post as @post" do
          # Trigger the behavior that occurs when invalid params are submitted
          Post.any_instance.stub(:save).and_return(false)
          post :create, post: FactoryGirl.attributes_for(:invalid_post)
          expect(assigns(:post)).to be_a_new(Post)
        end
      end
    end

    describe "when not signed in" do
      it "fails to create a new Post" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(0)
      end
    end
  end

  describe "PATCH update" do
    login_user
    before :each do
      @post = FactoryGirl.create :post, title: "Old Title", user: @logged_in_user
    end

    describe "when signed in" do
      describe "with valid params" do
        it "locates the requested post" do
          patch :update, id: @post,
            post: FactoryGirl.attributes_for(:post)
          expect(assigns(:post)).to eq(@post)
        end

        it "updates the requested post" do
          patch :update, id: @post,
            post: FactoryGirl.attributes_for(:post, title: "New Title")
          @post.reload
          expect(@post.title).to eq("New Title")
        end
      end

      describe "with invalid params" do
        it "does not change the post's attributes" do
          patch :update, id: @post,
            post: FactoryGirl.attributes_for(:invalid_post)
          @post.reload
          expect(@post.title).to eq("Old Title")
        end
      end
    end

    describe "when not signed in" do
      logout_user

      it "updates the requested post" do
        patch :update, id: @post,
          post: FactoryGirl.attributes_for(:post, title: "New Title")
        @post.reload
        expect(@post.title).to eq("Old Title")
      end
    end
  end

  describe "DELETE destroy" do
    login_user

    before :each do
      @post = FactoryGirl.create :post, user: @logged_in_user
    end

    describe "when signed in" do
      it "deletes the post" do
        expect{
          delete :destroy, id: @post
        }.to change(Post, :count).by(-1)
      end
    end

    describe "when not signed in" do
      logout_user

      it "deletes the post" do
        expect{
          delete :destroy, id: @post
        }.to change(Post, :count).by(0)
      end
    end
  end

end
