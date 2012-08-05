class Comment < ActiveRecord::Base
  attr_accessible :body, :name, :provider_id, :user_id
end
