class Discount < ApplicationRecord
  validates :percent, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true

  belongs_to :merchant

  # def self.disabled
  #   where(able: "Disabled")
  # end
  #
  # def self.enabled
  #   where(able: "Enabled")
  # end
  #
  # def self.top_five_items(merchant_id)
  #   Item.joins(invoices: :transactions)
  #       .where('transactions.result = ?', 1)
  #       .where('items.merchant_id = ?', merchant_id)
  #       .group('invoice_items.item_id, items.id')
  #       .select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
  #       .order(revenue: :desc).limit(5)
  # end
  #
  # def item_best_day
  #   Item.joins(invoices: :transactions)
  #       .where('transactions.result = ?', 1)
  #       .where('items.id = ?', self.id)
  #       .group('invoices.created_at')
  #       .select('invoices.created_at as items_day, sum(invoice_items.quantity) as total')
  #       .order(total: :desc)
  #       .order(items_day: :desc).limit(1)
  # end
end
