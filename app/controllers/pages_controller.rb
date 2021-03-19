class PagesController < ApplicationController
  def home
  	if current_user.nil?
  		render :main
  	end
   end

  def main

  end
end
