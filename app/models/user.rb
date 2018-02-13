class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  has_many :gossips

  before_validation :codepromo

  def codepromo
    unless ["petitcurieux"].include? promocode
    errors.add :email, "Ton code promo n'est pas valide, bien tenté !"
    end
  end
end
