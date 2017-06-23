class Sneaker < ApplicationRecord

searchkick word_start: [:name], searchable: [:name, :brand, :style_code]


  has_many :pins
  has_many :vendors, dependent: :destroy

  mount_uploader :photo, PhotoUploader
  mount_uploader :alt_photo, PhotoUploader

# paginates_per 2





end
