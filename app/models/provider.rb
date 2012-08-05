class Provider < ActiveRecord::Base
  attr_accessible :city, :insured, :latitude, :longitude, :name, :phone, :service_id, :state, :street, :website, :zip
end
