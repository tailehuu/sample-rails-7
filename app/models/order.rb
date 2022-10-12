class Order < ApplicationRecord
  # TODO very COOL feature
  # https://api.rubyonrails.org/v7.0.4/classes/ActiveRecord/Enum.html#method-i-enum
  enum :status, [:shipped, :being_packaged, :complete, :cancelled]

  validates :name, :status, presence: true
end
