class WaferMapsController < ApplicationController

  # POST /wafer_maps
  def create
    wafer = WaferMap.new(wafer_map_params)
    wafer.process
    render json: wafer
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def wafer_map_params
    params.require(:wafer_map).permit!
  end

end
