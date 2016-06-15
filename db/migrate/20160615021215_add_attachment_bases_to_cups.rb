class AddAttachmentBasesToCups < ActiveRecord::Migration
  def self.up
    change_table :cups do |t|
      t.attachment :bases
    end
  end

  def self.down
    remove_attachment :cups, :bases
  end
end
