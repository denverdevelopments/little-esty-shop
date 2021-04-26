require 'rails_helper'

RSpec.describe 'the create new discount form', type: :feature do
  before(:each) do
    @merchant_1 = Merchant.create!(name: "AA")

    @employee_1 = @merchant_1.discounts.create!(percent: 28, quantity: 5)
    @flier_1 = @merchant_1.discounts.create!(percent: 10, quantity: 10)
    # @tv_1 = @merchant_1.discounts.create!(percent: 15, quantity: 3)
  end

  # it 'has a link to merchants discounts index' do
  #   visit "/merchants/#{@merchant_1.id}/discounts"
  #     expect(page).to have_link("Merchant Discounts")
  #     click_link("Merchant Discounts")
  #     expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts")
  # end

  it 'has form to create new discount' do
      visit "/merchants/#{@merchant_1.id}/discounts/new"
      # save_and_open_page
    expect(page).to have_content('New Discount')
    expect(find('form')).to have_content('Percent')
    expect(find('form')).to have_content('Quantity')
    expect(page).to have_button("Create New Discount")
      click_on "Create New Discount"
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/new")
  end

  it "creates a new discount" do
    visit "/merchants/#{@merchant_1.id}/discounts/new"

    fill_in "Percent", with: 40
    fill_in "Quantity", with: 2
      click_button "Create New Discount"
    expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts")
    expect(page).to have_content(40)
  end

  describe 'sad path' do
    it 'does not allow creating an incomplete discount' do
      visit "/merchants/#{@merchant_1.id}/discounts/new"

      fill_in "Quantity", with: 2
        click_button "Create New Discount"
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/new")
      expect(page).to have_content("ERROR: Please enter percentage & quantity")
    end
  end
end
