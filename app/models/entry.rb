class Entry < ApplicationRecord
  belongs_to :user
  has_many :gratefulthings
  accepts_nested_attributes_for :gratefulthings, allow_destroy: true

  validates :title, presence: true
  validates :content, presence: true

  has_one_attached :photo
end
