class CalendarController < ApplicationController
  def index

  end

  def load
    owner = params[:owner] || 'Daniel'
    data = Calendar.load owner

    render json: data
  end
end
