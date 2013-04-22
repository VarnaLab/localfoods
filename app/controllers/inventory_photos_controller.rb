class InventoryPhotosController < ApplicationController
	def destroy
		respond_to do |format|
        @photo = InventoryPhoto.find(params[:id])
		@photo.destroy
        format.html { redirect_to(edit_user_path(current_user)) }
        format.xml  { head :ok }
    	end
	end
end