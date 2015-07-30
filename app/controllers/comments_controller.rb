class CommentsController < ApplicationController
	before_action :verify_user, only: [:edit, :update, :destroy]

	def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.create(comment_params)
		@comment.likes = 0
		@comment.user_id = current_user.id
		@comment.save
		redirect_to photo_path(@photo)

	end

	def edit
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.find(params[:id])
		if @comment.update(comment_params)
			redirect_to photo_path(@photo)
		else
			render 'edit'
		end
	end

	def destroy
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.find(params[:id])
		@comment.destroy
		redirect_to photos_path
	end

	def like
    	@comment = Comment.find(params[:id])
    	@comment.liked_by current_user
    	@comment.likes += 1
    	@comment.save
    	redirect_to :back
	end

	def unlike
  		@comment = Comment.find(params[:id])
  		@comment.downvote_from current_user
  		@comment.likes -= 1
  		@comment.save
	    redirect_to :back
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end

		def verify_user
			if current_user != Comment.find(params[:id]).user
  				flash[:error] = "You must be logged in to access this section"
  				redirect_to photos_path
  			end
		end

end