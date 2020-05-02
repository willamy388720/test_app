require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it "responds successfully" do
    get :index
    expect(response).to be_success
  end

  it "responds a 302 response" do
    customer = create(:customer)
    get :show, params: {id: customer.id}
    expect(response).to have_http_status(302)
  end

  describe 'as Logged Member' do

    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it 'Content-type' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, format: :json, params: {customer: customer_params}
      expect(response.content_type).to eq("application/json")
    end

    it 'Flash Notice' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: {customer: customer_params}
      expect(flash[:notice]).to match(/successfully created/)
    end
    
    it 'with valid attributes' do
      customer_params = attributes_for(:customer)
      sign_in @member
      expect{
        post :create, params: {customer: customer_params}
      }.to change(Customer, :count).by(1)
    end

    it '#show' do
      sign_in @member

      get :show, params: {id: @customer.id}
      expect(response).to have_http_status(200)
    end

    it 'render #show' do
      sign_in @member

      get :show, params: {id: @customer.id}
      expect(response).to render_template(:show)
    end
  end
end
