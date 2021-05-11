class Category < ApplicationRecord
    has_many :categorized_images
    has_many :images, :through => :categorized_images
end
