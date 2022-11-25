FactoryBot.define do
  factory :disbursement do
    amount {0.95}
    merchant
    week {Time.now.strftime("%U").to_i}
  end

  factory :disbursement_under_50 do
    amount {0.4}
    merchant
    week {Time.now.strftime("%U").to_i}
  end

  factory :disbursement_above_50_and_300 do
    amount {2.12}
    merchant
    week {Time.now.strftime("%U").to_i}
  end

  factory :disbursement_above_300 do
    amount {3.4}
    merchant
    week {Time.now.strftime("%U").to_i}
  end
end