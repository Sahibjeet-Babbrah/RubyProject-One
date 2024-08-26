class Quote < ApplicationRecord
    belongs_to :rfq, autosave: true
    belongs_to :user

    delegate :state, :to => :rfq, prefix: true, allow_nil: true
    delegate :state=, :to => :rfq, prefix: true
    delegate :length, to: :rfq, prefix: true, allow_nil: false
    delegate :length=, to: :rfq, prefix: true

    validates :cost, numericality: {greater_than_or_equal_to: 0.1, only_float: true}, on: :update
end
