class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    require 'routific'

    routific = Routific.setToken(ENV["routific_token"])

    visits = {
      "order_1" => {
        "start" => "9:00",
        "end" => "12:00",
        "duration" => 10,
        "location" => {
          "name" => "6800 Cambie",
          "lat" => 49.227107,
          "lng" => -123.1163085
        }
      }
    }

    fleet = {
      "vehicle_1" => {
        "start_location" => {
          "name" => "800 Kingsway",
          "lat" => 49.2553636,
          "lng" => -123.0873365
        },
        "end_location" => {
          "name" => "800 Kingsway",
          "lat" => 49.2553636,
          "lng" => -123.0873365
        },
        "shift_start" => "8:00",
        "shift_end" => "12:00"
      }
    }

    data = {
      visits: visits,
      fleet: fleet
    }

    route = Routific.getRoute(data)
    @route = route
    @vehicle = route.vehicleRoutes.first.first
  end
end
