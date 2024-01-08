# frozen_string_literal: true

class Bank < ApplicationRecord
  has_many :suppliers
  validates :name, presence: true, length: { maximum: 50 }
end
