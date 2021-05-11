class Image < ApplicationRecord
    belongs_to :user
    has_one_attached :photo, dependent: :destroy
    has_many :categorized_images
    has_many :categories, :through => :categorized_images
    # validates :photo, content_type: [:jpg, :jpeg, :png ]
end
