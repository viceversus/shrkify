class Link < ActiveRecord::Base
  extend FriendlyId
  friendly_id :vanity_url, :use => :slugged
  
  attr_accessible :url, :short_url, :slug, :visit_count, :vanity_url
  
  validates :url, :presence => true,
                  :uniqueness => true
                  
  validates :vanity_url, :format => { :with => /^[\-\w]+$/i } 
                  
  SHARKS = %w{ pavs8 thornton19 marleau12 couture39 clowe29 havlat9 niemi31 burns88 boyle22 vlasic44 demers60 braun61}

  def self.sharken(new_url)
    new_url.short_url = "#{new_url.id}#{SHARKS[rand(12)]}"
    new_url.save
  end
  
  def self.find_and_increment(params)
    link = self.find(params)
    link.visit_count += 1
    link.save
    link
  end
end
