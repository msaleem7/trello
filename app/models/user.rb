class User < ApplicationRecord
    # attr_accessible :password, :password_confirmation, :name, :email, :age

    has_many :tasks, dependent: :destroy
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50},confirmation: { case_sensitive: false }
    validates :password, presence: true, length: { in: 6..20, message:"password length must be between 6-20 characters" }
    validates :age, presence: true, numericality: {only_integer: true} 
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
