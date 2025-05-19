class User < ApplicationRecord
  # # extend Devise::Models
  # # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
    has_secure_password :password, validations: true
    validates :name, presence: true
    validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true
    validates :street_address, presence: true
    # validates :city_area, presence: true
    validates :city, presence: true
    # validates :county, presence: true
    validates :postal, presence: true
    validates :country, presence: true

    has_many :rfqs
    has_many :quotes
    has_many :trucks, dependent: :destroy

    accepts_nested_attributes_for :trucks

    # validate do |user|
    #   errors.add :email, :format, message: "Email not in proper format"
    # end
end
