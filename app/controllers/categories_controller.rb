class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @tasks = Task.where(category_id: params[:id])
  end

  def show_tasks
    @category = Category.find(params[:id])
    @tasks = Task.where(category_id: params[:id])
  end

  def new
    @task = Task.new
  end
end
