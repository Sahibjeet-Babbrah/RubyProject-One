class Item < ApplicationRecord
    belongs_to :rfq

    validates_presence_of :name, :description, :length, :width, :height, :weight, presence: true
    validates :length, :width, :height, :weight, numericality: {greater_than_or_equal_to: 0.01, only_float: true}
end