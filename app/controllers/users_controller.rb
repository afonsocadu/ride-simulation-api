class UsersController < ApplicationController
  before_action :authenticate_user!

  # DELETE /users/:id
  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: { message: 'User deleted successfully!' }
    else
      render json: { error: 'An error occurred when trying to delete the user', details: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end

# TODO: Evaluate whether callbacks are necessary. If not, refactor to use 'delete'.
