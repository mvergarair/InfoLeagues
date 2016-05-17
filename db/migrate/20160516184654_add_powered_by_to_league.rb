class AddPoweredByToLeague < ActiveRecord::Migration
  def change
  	add_column :leagues, :uses_liga_fc, :boolean, default: false
  end
end
