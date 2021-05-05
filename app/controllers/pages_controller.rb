class PagesController < ApplicationController
  def home
    render :main if current_user.nil?
  end

  def main; end
end
