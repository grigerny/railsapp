class Provider < ActiveRecord::Base
  attr_accessible :city, :insured, :latitude, :longitude, :name, :phone, :service_id, :state, :street, :website, :zip
  belongs_to :service
  belongs_to :user
  has_many :comments
  
  geocoded_by :address 
    after_validation :geocode
    
    def address
       [street, city, state].compact.join(', ')
     end
     
  acts_as_gmappable :check_process => false, :process_geocoding => false
  def gmaps4rails_title
        'You found me!'
      end
  
  has_reputation :votes, source: :user, aggregated_by: :sum
end
