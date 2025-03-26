class RidesController < ApplicationController
  before_action :authenticate_user!
  PERMITTED_PARAMS = %i[destinationLatitude destinationLongitude originLatitude originLongitude destination origin completed price].freeze

  # GET /rides
  def index
    records = Ride.all

    render status: :ok,
           json: records
  end

  # POST /rides/
  def create
    permitted_params = params.require(:rider_details).permit(PERMITTED_PARAMS)
    record = Ride.create!(
      user: current_user,
      destinationLatitude: permitted_params[:destinationLatitude],
      destinationLongitude: permitted_params[:destinationLongitude],
      originLatitude: permitted_params[:originLatitude],
      originLongitude: permitted_params[:originLongitude],
      completed: permitted_params[:completed],
      price: permitted_params[:price]
    )

    render status: :ok, json: record
  end


end
