class Link < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  attr_accessible :url, :short_url, :slug, :visit_count, :vanity_url  
  friendly_id     :vanity_url, :use => :slugged
  
  validates :url, :presence => true,
                  :uniqueness => true,
                  :format => { :with => /^http:\/\/|^https:\/\// }
                  
  validates_uniqueness_of :vanity_url, :allow_nil => true,
                                       :allow_blank => true
                                       
  default_scope order: 'links.created_at DESC'
  
  after_save :sharken
                  
  SHARKS = %w{ p4vs8 th0rN70n19 m4r1eAu12 c0u7Ure39 c10we29 h4v14t9 ni3mi31 BuRns88 b0y1e22 v1a5ic44 d3m3rs60 Br4un61}

  def sharken
    self.short_url = "#{self.id}#{SHARKS[rand(12)]}"
  end
  
  def self.find_and_increment(params)
    link = self.find(params)
    link.visit_count += 1
    link.save
    link
  end
end
