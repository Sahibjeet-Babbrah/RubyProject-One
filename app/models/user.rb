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

    # Handles if the user follows other
    has_many :active_relationships,
      class_name: "Followship",
      foreign_key: "follower_id",
      dependent: :destroy
    
    has_many :followees, through: :active_relationships, source: :followee

    has_many :passive_relationships,
      class_name: "Followship",
      foreign_key: "followee_id",
      dependent: :destroy
    
    has_many :followers, through: :passive_relationships, source: :follower

    def follow(user)
      followees << user unless self == user
    end

    def unfollow(followed_user)
      followees.delete followed_user
    end

    def following?(user)
      followees.include?(user)
    end

    def test
      return self.id
    end

    # validate do |user|
    #   errors.add :email, :format, message: "Email not in proper format"
    # end
end
