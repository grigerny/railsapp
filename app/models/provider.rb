class Provider < ActiveRecord::Base
  attr_accessible :city, :insured, :latitude, :longitude, :name, :phone, :service_id, :state, :street, :website, :zip
  belongs_to :service
  belongs_to :user
  has_many :comments
end
