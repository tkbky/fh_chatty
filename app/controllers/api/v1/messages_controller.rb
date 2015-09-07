module Api
  module V1
    class MessagesController < BaseController
      def index
        render json: Message.limit(10)
      end
    end
  end
end
