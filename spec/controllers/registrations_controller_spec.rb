require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:user)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe 'POST #create' do
    before { post :create, user: params }

    context 'with valid params' do
      let(:params) { attributes_for(:user) }

      it { expect(assigns(:user)).to be_persisted }
      it { expect(response).to redirect_to channels_path }
    end

    context 'with blank email' do
      let(:params) { attributes_for(:user, :blank_email) }

      it { expect(assigns(:user)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
    end

    context 'with blank password' do
      let(:params) { attributes_for(:user, :blank_password) }

      it { expect(assigns(:user)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
    end

    context 'with unconfirm password' do
      let(:params) { attributes_for(:user, :blank_password_confirmation) }

      it { expect(assigns(:user)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
    end
  end

  describe 'GET #edit' do
    let!(:user) { create(:user) }

    before do
      login_user(user)
      get :edit, id: user.id
    end

    it { expect(assigns(:user)).to be_persisted }
    it { expect(response).to render_template(:edit) }
  end

  describe 'PUT #update' do
    let!(:user) { create(:user) }

    before do
      login_user(user)
      put :update, id: user.id, user: params
    end

    context 'with new email' do
      let(:params) { attributes_for(:user, email: 'new@example.com') }

      it { expect(assigns(:user).email).to eq 'new@example.com' }
      it { expect(response).to redirect_to channels_path }
    end
  end
end
