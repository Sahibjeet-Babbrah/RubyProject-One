class TruckController < ApplicationController
  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)

    @truck.save
  end

  private
  def truck_params
    params.require(:truck).permit(:flatbed_trucks, :refrigerated_trucks, :straight_trucks, :tanker_trucks, :jumbo_trailer_trucks, 
                                  :semi_trailer_trucks, :dump_trucks, :box_trucks, :tail_lift_trucks)
  end
end