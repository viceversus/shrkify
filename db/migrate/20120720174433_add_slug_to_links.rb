class AddSlugToLinks < ActiveRecord::Migration
  def change
    add_column :links, :slug, :string, unique: true
  end
end
