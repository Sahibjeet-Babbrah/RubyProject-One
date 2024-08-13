class Quote < ApplicationRecord
    belongs_to :rfq, autosave: true
    belongs_to :user

    delegate :state, :to => :rfq, prefix: true, allow_nil: true
    delegate :state=, :to => :rfq, prefix: true
    delegate :length, to: :rfq, prefix: true, allow_nil: false
    delegate :length=, to: :rfq, prefix: true
end
