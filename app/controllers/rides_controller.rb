class RidesController < ApplicationController
  before_action :authenticate_user!

  # GET /rides
  def index
    records = Ride.all

    render status: :ok,
           json: records
  end
end
