require 'spec_helper'

describe UsersController do

  describe "GET index" do
    it "assigns all users as @users" do
      user_1 = FactoryGirl.create :user, username: "User 1"
      user_2 = FactoryGirl.create :user, username: "User 2"
      user_3 = FactoryGirl.create :user, username: "User 3"
      get :index
      expect(assigns(:users)).to eq([user_1, user_2, user_3])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = FactoryGirl.create :user
      get :show, id: user
      expect(assigns(:user)).to eq user
    end
  end

  describe "PATCH update" do
    describe "when signed in" do
      login_user
      before :each do
        @user = @logged_in_user
      end

      describe "with valid params" do
        it "locates the requested user" do
          patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
          expect(assigns(:user)).to eq(@user)
        end

        it "updates the requested user" do
          patch :update, id: @user,
            user: FactoryGirl.attributes_for(:user, username: "New Name")
          @user.reload
          expect(@user.username).to eq("New Name")
        end
      end

      describe "with invalid params" do
        it "does not change the user's attributes" do
          patch :update, id: @user,
            user: FactoryGirl.attributes_for(:invalid_user)
          @user.reload
          expect(@user.username).to eq("logged_in")
        end
      end
    end

    describe "when not signed in" do
      before :each do
        @user = FactoryGirl.create :user, username: "Old Name"
      end

      describe "with valid params" do
        it "locates the requested user" do
          patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
          expect(assigns(:user)).to eq(@user)
        end

        it "updates the requested user" do
          patch :update, id: @user,
            user: FactoryGirl.attributes_for(:user, username: "New Name")
          @user.reload
          expect(@user.username).to eq("Old Name")
        end
      end
    end

    describe "when signed in to wrong account" do
      login_user
      before :each do
        @user = FactoryGirl.create :user, username: "Old Name"
      end

      describe "with valid params" do
        it "locates the requested user" do
          patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
          expect(assigns(:user)).to eq(@user)
        end

        it "updates the requested user" do
          patch :update, id: @user,
            user: FactoryGirl.attributes_for(:user, username: "New Name")
          @user.reload
          expect(@user.username).to eq("Old Name")
        end
      end
    end
  end

end
