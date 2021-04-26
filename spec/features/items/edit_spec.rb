require 'rails_helper'

RSpec.describe 'merchant item edit', type: :feature do
  before(:each) do
    @merchant = Merchant.create!(name: "CCC")
    @item = Item.create!(name: "it1", description: "thing", unit_price: 10, able: "Disabled", merchant_id: @merchant.id)
  end

  it 'allows to way to update items' do
    visit "/items/#{@item.id}"

    click_on "Edit Item"

    expect(page).to have_current_path("/items/#{@item.id}/edit")
  end

  it 'shows the item edit form' do
    visit "/items/#{@item.id}/edit"

    expect(find('form')).to have_content('Name')
    expect(find('form')).to have_content('Description')
    expect(find('form')).to have_content('Unit price')
    expect(find('form')).to have_content('Status')
    expect(find('form')).to have_button('Submit Edit')
  end

  it 'allows edit to be submitted' do
    visit "/items/#{@item.id}/edit"

    fill_in 'Name', with: 'Newy McTestFace'

    click_button "Submit Item"
    expect(page).to have_current_path("/merchants/#{@merchant.id}items")

    expect(page).to have_content('Newy McTestFace')
    expect(page).to have_content(@item.description)
    expect(page).to have_content(@item.unit_price)
  end
end

# 1) merchant item edit allows edited to be submitted
#      Failure/Error: fill_in 'Name', with: 'Newy McTestFace'
#
#      Capybara::ElementNotFound:
#        Unable to find field "Name" that is not disabled
# ./spec/features/items/edit_spec.rb:30:in `block (2 levels) in <top (required)>'
