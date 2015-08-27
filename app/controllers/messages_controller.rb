class MessagesController < ApplicationController
  respond_to :js

  def create
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.build(message_params)
    MessagePublisher.new(@channel, @message).call if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
