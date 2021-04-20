require 'rails_helper'

RSpec.describe 'admin invoice show page', type: :feature do
  it 'has the invoice: id, status' do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    invoice1 = customer.invoices.create!(status: 'in progress')
    
    visit "/admin/invoices/#{invoice1.id}"
    
    expect(page).to have_content("#{invoice1.id}")
    expect(page).to have_content("#{invoice1.status}")
  end
  
  it "has the customer name, created_at 'Thursday, July 18, 2019'" do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    invoice1 = customer.invoices.create!(status: 'in progress', created_at: 'Thursday, July 18, 2019')
    
    visit "/admin/invoices/#{invoice1.id}"
    expect(page).to have_content(customer.first_name)
    expect(page).to have_content(customer.last_name)
    expect(page).to have_content('Thursday, July 18, 2019')
  end

  it 'shows all the items on that invoice' do
    customer = Customer.create!(first_name: "A", last_name: "AA")
    merchant = Merchant.create!(name: "merchant")
    invoice1 = customer.invoices.create!(status: 'in progress')
    item1 = merchant.items.create!(name: "thing", description: "thingy", unit_price: 1)
    item2 = merchant.items.create!(name: "stuff", description: "stuffy", unit_price: 2)
    item3 = merchant.items.create!(name: "it", description: "itty", unit_price: 3)
    item4 = merchant.items.create!(name: "fake", description: "fakey", unit_price: 4)
    invoice_item1 = InvoiceItem.create!(item: item1, invoice: invoice1, quantity:10, unit_price: 11, status: 0)
    invoice_item2 = InvoiceItem.create!(item: item2, invoice: invoice1, quantity:20, unit_price: 22, status: 1)
    invoice_item3 = InvoiceItem.create!(item: item3, invoice: invoice1, quantity:30, unit_price: 33, status: 2)
    
    visit "/admin/invoices/#{invoice1.id}"
    
    within("#items") do
      within("#item-#{item1.id}") do
        expect(page).to have_content(item1.name)
        expect(page).to have_content(invoice_item1.quantity)
        expect(page).to have_content(invoice_item1.unit_price)
        expect(page).to have_content(invoice_item1.status)
      end

      within("#item-#{item2.id}") do
        expect(page).to have_content(item2.name)
        expect(page).to have_content(invoice_item2.quantity)
        expect(page).to have_content(invoice_item2.unit_price)
        expect(page).to have_content(invoice_item2.status)
      end

      within("#item-#{item3.id}") do
        expect(page).to have_content(item3.name)
        expect(page).to have_content(invoice_item3.quantity)
        expect(page).to have_content(invoice_item3.unit_price)
        expect(page).to have_content(invoice_item3.status)
      end
    end
  end
end