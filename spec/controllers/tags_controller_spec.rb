require 'spec_helper'

describe TagsController do

  describe "GET index" do
    it "assigns all tags as @tags" do
      tag_1 = FactoryGirl.create :tag, name: "Tag 1"
      tag_2 = FactoryGirl.create :tag, name: "Tag 2"
      tag_3 = FactoryGirl.create :tag, name: "Tag 3"
      get :index
      assigns(:tags).should eq([tag_1, tag_2, tag_3])
    end
  end

  describe "GET show" do
    it "assigns the requested tag as @tag" do
      tag = FactoryGirl.create :tag
      get :show, id: tag
      expect(assigns(:tag)).to eq tag
    end
  end

end
