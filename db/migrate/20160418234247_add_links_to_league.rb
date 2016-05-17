class AddLinksToLeague < ActiveRecord::Migration
  def change
  	add_column :leagues, :website_link, :string
  	add_column :leagues, :facebook_link, :string
  	add_column :leagues, :instagram_link, :string
  	add_column :leagues, :twitter_link, :string
  end
end
