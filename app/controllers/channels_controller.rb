class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
    utmz = cookies["__utmz"]
    utmb = cookies["__utmb"]
    utma = cookies["__utma"]
    @data = GaCookieParser::GaCookieParser.new(:utmz => utmz, :utmb => utmb, :utma => utma)
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      redirect_to @channel, notice: 'A new channel has been created!'
    else
      flash[:error] = 'Sorry, fail to create channel'
      redirect_to channels_path
    end
  end

  def show
    @channel = Channel.find(params[:id])
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end
