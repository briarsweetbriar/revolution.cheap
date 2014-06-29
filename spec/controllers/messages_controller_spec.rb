require 'spec_helper'

describe MessagesController do

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Message" do
        expect {
          post :create, message: FactoryGirl.attributes_for(:message)
        }.to change(Message, :count).by(1)
      end

      it "assigns a newly created message as @message" do
        post :create, message: FactoryGirl.attributes_for(:message)
        expect(assigns(:message)).to be_a(Message)
        expect(assigns(:message)).to be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved message as @message" do
        # Trigger the behavior that occurs when invalid params are submitted
        Message.any_instance.stub(:save).and_return(false)
        post :create, message: FactoryGirl.attributes_for(:invalid_message)
        expect(assigns(:message)).to be_a_new(Message)
      end
    end
  end
end
