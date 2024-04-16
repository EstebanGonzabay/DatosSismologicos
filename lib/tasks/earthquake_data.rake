
require 'httparty'

namespace :earthquake_data do
  desc "Fetch and persist earthquake data from USGS"
  task fetch_data: :environment do
    response = HTTParty.get("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson")
    
    if response.success?
      data = JSON.parse(response.body)
      
      data["features"].each do |feature_data|
        Feature.create!(
          external_id: feature_data["id"],
          magnitude: feature_data["properties"]["mag"],
          place: feature_data["properties"]["place"],
          time: Time.at(feature_data["properties"]["time"] / 1000),
          tsunami: feature_data["properties"]["tsunami"],
          mag_type: feature_data["properties"]["magType"],
          title: feature_data["properties"]["title"],
          longitude: feature_data["geometry"]["coordinates"][0],
          latitude: feature_data["geometry"]["coordinates"][1]
        )
      end
      
      puts "Earthquake data has been fetched and persisted successfully!"
    else
      puts "Failed to fetch earthquake data. Status code: #{response.code}, Message: #{response.message}"
    end
  end
end
