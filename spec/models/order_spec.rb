require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)
    expect(customer.orders.count).to eq(3)
  end
end
