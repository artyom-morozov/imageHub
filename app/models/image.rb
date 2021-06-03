class Image < ApplicationRecord
    belongs_to :user
    has_one_attached :photo, dependent: :destroy
    has_many :categorized_images
    has_many :categories, :through => :categorized_images
    # validates :photo, content_type: [:jpg, :jpeg, :png ]

    def self.search(search)
        if search
            return Image.where("title LIKE ?", "%" + search + "%").or(Image.where("description LIKE ?", "%" + search + "%")).or(Image.joins(:categories).where("categories.name Like ?","%" + search + "%"))
        else
            return Image.all
        end
    end
end
