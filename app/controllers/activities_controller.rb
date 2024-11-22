class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def create
    @new_activity = Activity.new(activity_params)
    @new_activity.user = current_user
    if @new_activity.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @deleted_activity = Activity.find(params[:id])
    if @deleted_activity.destroy
      redirect_to dashboard_path, notice: 'Activity was successfully deleted.'
    else
      redirect_to dashboard_path, alert: 'Failed to delete the activity.'
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :price)
  end
end
