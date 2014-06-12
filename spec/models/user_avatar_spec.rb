require 'spec_helper'

describe User do

  context "associates through" do
    before :each do
      @user_avatar = FactoryGirl.build(:user_avatar)
    end

    it "belongs_to user" do
      expect(@user_avatar).to belong_to(:user)
    end
  end
end
