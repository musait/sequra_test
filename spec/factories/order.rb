FactoryBot.define do
  factory :order do
    amount {100}
    completed_at { Time.now - 1.week}
    merchant
    shopper
    disbursement
  end

  factory :order_not_disbursed do
    amount {100}
    completed_at { Time.now - 1.week + 1.day}
    merchant
    shopper
  end

  factory :order_not_completed do
    amount {100}
    merchant
    shopper
  end

  factory :order_under_50 do
    amount {40}
    merchant
    shopper
    disbursement
  end

  factory :order_above_50_and_300 do
    amount {250}
    merchant
    shopper
    disbursement
  end

  factory :order_above_300 do
    amount {400}
    merchant
    shopper
    disbursement
  end
end