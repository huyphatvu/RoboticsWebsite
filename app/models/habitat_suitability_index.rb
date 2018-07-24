class HabitatSuitabilityIndex < ApplicationRecord
  def display_url
    "https://unola.maps.arcgis.com/apps/Embed/index.html?webmap=#{self.map_url}&extent=-91.6058,28.8606,-88.4033,30.4573&zoom=true&previewImage=false&scale=true&search=true&searchextent=true&legendlayers=true&disable_scroll=true&theme=light"
  end
end
