class HomeController < ApplicationController
  before_filter :login_required, :except => %w[ show ]
  def index
    
  end
end
