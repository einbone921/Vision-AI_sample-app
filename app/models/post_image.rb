class PostImage < ApplicationRecord
  belongs_to :image_album
  attachment :image
end

