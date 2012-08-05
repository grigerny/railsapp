class User < ActiveRecord::Base
  attr_accessible :email, :name
    has_many :comments, :dependent => :destroy
end
