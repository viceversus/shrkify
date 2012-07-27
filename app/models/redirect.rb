class Redirect < ActiveRecord::Base
  attr_accessible :ip_address, :link_id
  
  belongs_to :link
end
