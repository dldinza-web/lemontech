require 'rails_helper'

RSpec.describe CalendarController, type: :controller do
  it "#index" do
    get :index
    expect(response).to be_success
  end

  describe "#load" do
    before { get :load, format: :json }

    it "request is success" do
      expect(response.status).to eq 200
    end

    it "responses with the calendar of one owner by default" do
      json = JSON.parse response.body

      expect(json.keys).to eq ["lunes", "martes", "miercoles", "jueves", "viernes"]
    end

    it "returns the calendar of an owner specified" do
      get :load, format: :json, params: { owner: 'Daniel' }
      json = JSON.parse response.body

      json.values.each do |day_items|
        day_items.each do |day_item|
          expect(day_item['nombre']).to eq 'Daniel'
        end
      end
    end
  end
end
