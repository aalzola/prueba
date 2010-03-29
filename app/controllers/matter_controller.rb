class MatterController < ApplicationController
  auto_complete_for :cityCouncil, :city 
  def create
  end
  def get_map
    respond_to do |format|
      format.js
    end
  end
  def ignore_map
    
  end
end
