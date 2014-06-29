class MessagesController < ApplicationController

  # POST /messages.json
  def create
    @message = Message.new(message_params)

    if @message.save
      MessageMailer.deliver_message(@message).deliver
      render json: @message, status: :created
    else
      render_validation_errors @message.errors
    end
  end

  private
  def message_params
    params.require(:message).permit(:name, :email, :phone, :body)
  end
end