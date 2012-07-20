class AddColumnsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :url, :string
    add_column :links, :short_url, :string
  end
end
