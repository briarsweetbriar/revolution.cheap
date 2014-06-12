require 'spec_helper'

describe UserAvatarsController do

  describe "GET show" do
    it "assigns the requested user_avatar as @user_avatar" do
      user_avatar = FactoryGirl.create :user_avatar
      get :show, id: user_avatar
      expect(assigns(:user_avatar)).to eq user_avatar
    end
  end

  describe "POST create" do
    describe "when signed in" do
      login_user
      describe "with valid params" do
        it "creates a new UserAvatar" do
          expect {
            post :create, user_avatar: FactoryGirl.attributes_for(:user_avatar)
          }.to change(UserAvatar, :count).by(1)
        end

        it "assigns a newly created user_avatar as @user_avatar" do
          post :create, user_avatar: FactoryGirl.attributes_for(:user_avatar)
          expect(assigns(:user_avatar)).to be_a(UserAvatar)
          expect(assigns(:user_avatar)).to be_persisted
        end
      end
    end

    describe "when not signed in" do
      it "does not save the user_avatar" do
        expect {
          post :create, user_avatar: FactoryGirl.attributes_for(:user_avatar)
        }.to change(UserAvatar, :count).by(0)
      end
    end
  end

end
