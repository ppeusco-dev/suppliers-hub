# frozen_string_literal: true

class Bank < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
end
