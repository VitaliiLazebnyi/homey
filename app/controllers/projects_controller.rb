# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order(:id)
  end
end
