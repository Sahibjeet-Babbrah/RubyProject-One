class Rfq < ApplicationRecord
    belongs_to :user

    has_many :items, dependent: :destroy, inverse_of: :rfq
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
    
    has_many :quotes
end