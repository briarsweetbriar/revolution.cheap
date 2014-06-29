require 'spec_helper'

describe Message do

  context "validates" do
    before :each do
      @message = FactoryGirl.build(:message)
    end

    it "the presence of a name" do
      expect(@message).to validate_presence_of(:name)
    end

    it "that the name is between 3 and 100 characters" do
      expect(@message).to ensure_length_of(:name).is_at_least(3).is_at_most(100)
    end

    it "the presence of an email" do
      expect(@message).to validate_presence_of(:email)
    end

    it "the presence of a phone number" do
      expect(@message).to validate_presence_of(:phone)
    end

    it "the presence of the body" do
      expect(@message).to validate_presence_of(:body)
    end

    it "that the body is between 100 and 10000 characters" do
      expect(@message).to ensure_length_of(:body).is_at_least(100).is_at_most(10000)
    end
  end
end
