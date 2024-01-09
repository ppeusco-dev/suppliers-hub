# frozen_string_literal: true


class Bank < ApplicationRecord
  include WillPaginate::CollectionMethods

  has_many :suppliers
  validates :name, presence: true, length: { maximum: 50 }
end
