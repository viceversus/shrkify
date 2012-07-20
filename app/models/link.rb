class Link < ActiveRecord::Base
  attr_accessible :url, :short_url, :slug
  
  validates :url, presence: true,
                  uniqueness: true
                  
  SHARKS = %w{ pavs8 thornton19 marleau12 couture39 clowe29 havlat9 niemi31 burns88 boyle22 vlasic44 demers60 braun61}

  def self.sharken(new_url)
    new_url.short_url = "#{new_url.id}#{SHARKS[rand(12)]}"
    new_url.save
  end
end
