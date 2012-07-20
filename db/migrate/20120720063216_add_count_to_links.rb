class AddCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :visit_count, :integer, :default => 0
  end
end
