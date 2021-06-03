class CategoriesController < ApplicationController
     # GET /images or /images.json
  def index
    @categories = Category.all
  end
end
