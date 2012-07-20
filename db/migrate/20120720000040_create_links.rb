class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link
      t.string :short_link
      t.string :slug

      t.timestamps
    end
  end
end
