class CreateRedirects < ActiveRecord::Migration
  def change
    create_table :redirects do |t|
      t.integer :link_id
      t.string :ip_address

      t.datetime :created_at
    end
  end
end
