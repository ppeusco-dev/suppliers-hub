class Supplier < ApplicationRecord
  belongs_to :bank

  validates :name, presence: true, length: { maximum: 255 }
  validates :nit, format: { with: /\A\d{9}-?\d?\z/, message: "debe seguir el formato 9 dígitos seguido de un guión y un dígito opcional" }
  validates :contact_person_name, presence: true, length: { maximum: 255 }
  validates :contact_person_phone, length: { maximum: 10 }, allow_nil: true
  validates :bank_account_number, length: { maximum: 15 }, allow_blank: true
end
