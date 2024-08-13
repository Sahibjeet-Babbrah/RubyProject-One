class Rfq < ApplicationRecord
    belongs_to :user

    has_many :items, dependent: :destroy, inverse_of: :rfq
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
    
    has_many :quotes, dependent: :destroy, inverse_of: :rfq
    accepts_nested_attributes_for :quotes

    validates :pickup_name, presence: true
    validates :pickup_street_address, presence: true
    validates :pickup_city, presence: true
    validates :pickup_postal, presence: true
    validates :pickup_state, presence: true
    validates :pickup_country, presence: true

    validates :shipto_name, presence: true
    validates :shipto_street_address, presence: true
    validates :shipto_city, presence: true
    validates :shipto_postal, presence: true
    validates :shipto_state, presence: true
    validates :shipto_country, presence: true

    validates :pickup_date, :delivery_date, presence: true
    # validate :delivery_date_after_pickup_date

    validates :items, length: {minimum: 1, message: "Must contain at least 1 item"}
end