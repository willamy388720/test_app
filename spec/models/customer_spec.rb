require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Create Customer' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'Herança' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }
end
