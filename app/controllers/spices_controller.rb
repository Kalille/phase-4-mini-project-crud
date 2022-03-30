class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        spices = Spice.all
        render json: spices
      end

      def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created

      end

def update
    spice = find_spice
    if spice
      spice.update(spice_params)
      render json: spice
    else
      render_not_found_response
    end
end



def destroy
    def destroy
        spice = find_spice
        if spice
          spice.destroy
          head :no_content
        else
          render_not_found_response
        end
      end
end




private
  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found_response
    render json: { error: "spice not found" }, status: :not_found
  end

  def find_spice
    Spice.find(params[:id])
  end
end
