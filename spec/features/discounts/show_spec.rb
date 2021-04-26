require 'rails_helper'

RSpec.describe 'the merchant discount show page', type: :feature do
  before(:each) do
    @merchant_1 = Merchant.create!(name: "AA")
    @merchant_2 = Merchant.create!(name: "BB")

    @employee_1 = @merchant_1.discounts.create!(percent: 28, quantity: 5)
    @flier_1 = @merchant_1.discounts.create!(percent: 10, quantity: 10)
    @tv_1 = @merchant_1.discounts.create!(percent: 15, quantity: 3)
    @promo_2 = @merchant_2.discounts.create!(percent: 12, quantity: 10)
    @single_2 = @merchant_2.discounts.create!(percent: 20, quantity: 1)
  end

  it 'has item name, description, price' do
    visit "/merchants/#{@merchant_1.id}/dashboard"

    expect(page).to have_content(@item1.name)
    expect(page).to have_content(@item1.description)
    expect(page).to have_content(@item1.unit_price)
  end

  it 'has a link to update the item attributes' do
    visit "/items/#{@item1.id}"

    expect(page).to have_link("Edit Item")
    # click_link "Edit Item"
    # expect(current_path).to eq("/merchants/#{@merchant1.id}/edit")
  end
end
