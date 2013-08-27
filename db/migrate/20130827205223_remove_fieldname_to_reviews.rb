class RemoveFieldnameToReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :decision
  end

  def down
    add_column :reviews, :decision, :string
  end
end
