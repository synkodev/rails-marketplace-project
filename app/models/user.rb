class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :products, dependent: :nullify
  has_many :carts, through: :orders

  before_validation :remove_special_characters

  validates :address, :terms_conditions, :gender, presence: true
  validates :first_name, :last_name, presence: true, length: { minimum: 3 }
  validates :phone_number, presence: true, format: { with: /(\(\d{2}\)|\d{2})?\s?\d{4,5}-?\d{4}/ }
  validates :personal_id, presence: true, format: { with: /\d{11}/ }
  validates :birth_date, presence: true
  validate  :adult?

  private

  def remove_special_characters
    self.phone_number = phone_number.gsub(/[.\-\(\)\s]/, '') unless phone_number.nil?
    self.personal_id = personal_id.gsub(/[.\-\(\)\s]/, '') unless personal_id.nil?
  end

  def adult?
    if birth_date.present? && birth_date > 18.years.ago
      errors.add(:birth_date, 'should be over 18 years ago')
    end
  end
end
