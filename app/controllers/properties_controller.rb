class PropertiesController < ApplicationController
  def index
  end

  def new
    @property = Property.new
  end
end
