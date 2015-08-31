require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #landing' do
    before { get :landing }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:landing) }
  end
end
