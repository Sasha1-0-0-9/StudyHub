class CategoriesController < ApplicationController
  before_action :set_category
  def show
    @tasks = Task.where(category_id: params[:id])
  end

  def show_tasks
    # @category = Category.find(params[:id])
    @tasks = Task.where(category_id: params[:id])
    @is_empty = true
  end

  def new
    @task = Task.new
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
