class Service < ActiveRecord::Base
  attr_accessible :category, :title
  has_many :providers

  def self.search(search)
    search.blank? ? [] : all(:conditions => ['title LIKE ?', "%#{search.downcase}%"])
    end
end


