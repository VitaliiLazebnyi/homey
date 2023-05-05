# frozen_string_literal: true

class UpdatesController < ApplicationController
  before_action :load_project

  def index; end

  def create
    ActiveRecord::Base.transaction do
      update = @project.updates.create!(create_params)
      @project.update!(status: project_status_param) if update.change_status?
    end

    redirect_to project_updates_path(@project)
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def create_params
    params.require(:update).permit(:kind, :text)
  end

  def project_status_param
    params[:update][:status]
  end
end
