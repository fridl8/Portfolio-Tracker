class Portfolio < ApplicationRecord
  validates :portfolio_name, presence: true

  belongs_to :user
  has_many :positions
  has_many :stocks, through: :positions

  def total_value
    value = 0
    positions.each do |position|
       value += (position.stock.current_price.to_f * position.owned_shares)
    end
    value.to_f
  end

  def original_value
    value = 0
    positions.each do |position|
      value += (position.purchase_price * position.owned_shares)
    end
    value.to_f
  end

  def total_pnl
    total_value - original_value
  end

  def percent_change
    (total_value - original_value) / original_value * 100
  end

  def css_green_or_red
    if total_pnl >= 0
      "green-money"
    elsif total_pnl < 0
      "red-money"
    end
  end

end
