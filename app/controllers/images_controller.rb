class ImagesController < ApplicationController

  def image_params
    params.require(:image).permit(:content)
  end

end
