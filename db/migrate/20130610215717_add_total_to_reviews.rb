class AddTotalToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :total, :integer
  end
end
