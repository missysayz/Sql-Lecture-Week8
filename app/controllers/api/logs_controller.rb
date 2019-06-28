class Api::LogsController < ApplicationController

  def monthly_rental_trend 
    render json: Log.monthly_rental_trend
  end 

  def yearly_rental_trend 
    render json: Log.yearly_rental_trend
  end 
end
