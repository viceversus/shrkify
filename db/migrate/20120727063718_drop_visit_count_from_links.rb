class DropVisitCountFromLinks < ActiveRecord::Migration
  def up
    remove_column :links, :visit_count
  end

  def down
  end
end
