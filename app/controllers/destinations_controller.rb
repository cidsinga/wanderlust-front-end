class DestinationsController < ApplicationController

  def index
    # http://localhost:3000/destinations?country=japan

    country = params[:country]
    city = params[:city]
    specific_location = params[:specific_location]
    response = HTTParty.get('http://localhost:3000/destinations')
    puts response[0]
    @destinations = response.map {|index| Destination.new(:id => index['id'], :country => index['country'], :city => index['city'], :specific_location => index['specific_location'])}
    render :index
  end

  def show
    @destination = Destination.find(params[:id])
    response = HTTParty.get("http://localhost:3000/destinations/#{@destination.id}")
  end

  # def create
  #   @destination = HTTParty.post('http://localhost:3000/destinations')
  #   json_response(@destination, :created)
  # end

  # def update
  #   @destination = Destination.find(params[:id])
  #   @destination = HTTParty.put("http://localhost:3000/destinations/#{@destination.id}")
  #   if @destination.update!(destination_params)
  #     render status: 200, json: {
  #       message: "This destination has been updated successfully."
  #     }
  #   end
  # end

  # def destroy
  #   @destination = Destination.find(params[:id])
  #   @destination.destroy
  # end

  private


  def destination_params
    params.permit(:country, :city, :specific_location)
  end

end
