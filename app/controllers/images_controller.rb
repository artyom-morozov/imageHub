class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: %i[ edit update destroy ]
  
  # GET /images or /images.json
  def index

    if params[:id]
      @image_user = User.all.find(params[:id])
      @images = @image_user.images
    elsif params[:search]
      @images = Image.search(params[:search])
    elsif params[:category]
      @category = Category.all.find(params[:category])
      @images = @category.images
    else
      @images = Image.all
    end
  end

  # GET /images/1 or /images/1.json
  def show
    @photo = @image.photo.variant(resize_to_fit: [500, 500], saver: { quality: 1 }).blob
  end

  # GET /images/new
  def new
    @image = current_user.images.build
  end

  # GET /images/1/edit
  def edit
  end



  # POST /images or /images.json
  def create
    # @image = Image.new(image_params)
    @image = current_user.images.build(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1 or /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1 or /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #  Make sure correct user is logged in
  def correct_user
    @image = current_user.images.find_by(id: params[:id])
    redirect_to images_path, notice: "Not authorize to edit this image" if @image.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:title, :search, :description, :user_id, :photo, category_ids: [])
    end
end
