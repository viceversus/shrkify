class AddVanityUrlToLinks < ActiveRecord::Migration
  def change
    add_column :links, :vanity_url, :string, :unique => true
    remove_column :links, :slug
  end
end
