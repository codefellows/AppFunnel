class AddSocialLinksToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :twitter, :string
    add_column :profiles, :linkedin, :string
    add_column :profiles, :github, :string
    add_column :apns, :recommendation, :string
  end
end
