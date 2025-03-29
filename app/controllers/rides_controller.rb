class RidesController < ApplicationController
  before_action :authenticate_user!
  PERMITTED_PARAMS = %i[destinationLatitude destinationLongitude originLatitude originLongitude destination origin completed price].freeze

  # GET /rides
  def index
    records = Ride.where(user: current_user)

    render status: :ok,
           json: { rides: records, user_email: current_user.email, total_rides: records.count}
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


  # GET /rides/:id
  def update
    status = params.require("ride")["completed"]
    record = Ride.find(params[:id])

    if (record.update!(completed: status))
      render status: :ok, json: record
    else
      render status: :unprocessable_entity, json: { errors: record.errors }
    end
  end
end
