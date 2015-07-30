class PhotosController < ApplicationController
	before_action :check_user, only: [:edit, :update, :destroy] 
	

	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
		unless @photo.public || current_user == @photo.user
			redirect_to photos_path
		end
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = current_user.photos.build(photos_params)
		if @photo.save
			redirect_to photos_path
		else
			render 'new'
		end
	end

	def edit
		@photo = current_user.photos.find(params[:id])
	end

	def update
		@photo = current_user.photos.find(params[:id])
		if @photo.update(photos_params)
			redirect_to @photo
		else
			render 'edit'
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to photos_path
	end

private
	def photos_params
		params.require(:photo).permit(:public, :caption, :image)
	end

	
end