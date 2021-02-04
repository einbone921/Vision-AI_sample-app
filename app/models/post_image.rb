class PostImage < ApplicationRecord
  belongs_to :image_album
  has_many :tags
  attachment :image
end

