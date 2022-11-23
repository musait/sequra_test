class Disbursement < ApplicationRecord
  belongs_to :order
  belongs_to :merchant
end
