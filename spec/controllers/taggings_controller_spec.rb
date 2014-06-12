require 'spec_helper'

describe TaggingsController do

  describe "GET index" do
    it "assigns all taggings as @taggings" do
      tagging_1 = FactoryGirl.create :tagging
      tagging_2 = FactoryGirl.create :tagging
      tagging_3 = FactoryGirl.create :tagging
      get :index
      assigns(:taggings).should eq([tagging_1, tagging_2, tagging_3])
    end
  end

  describe "GET show" do
    it "assigns the requested tagging as @tagging" do
      tagging = FactoryGirl.create :tagging
      get :show, id: tagging
      expect(assigns(:tagging)).to eq tagging
    end
  end

end
