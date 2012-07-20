class RemoveColumnsFromLinks < ActiveRecord::Migration
  def up
    remove_column :links, :link
    remove_column :links, :short_link
  end

  def down
    add_column :links, :short_link, :string
    add_column :links, :link, :string
  end
end
