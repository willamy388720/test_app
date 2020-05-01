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

  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Maculino Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq("M")
  end

  it { expect{ create(:customer) }.to change{Customer.all.size}.by(1) }
end
