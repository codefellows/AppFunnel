class AddDecisionToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :decision, :string
  end
end
