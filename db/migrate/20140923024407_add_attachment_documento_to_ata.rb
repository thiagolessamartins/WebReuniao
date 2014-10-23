class AddAttachmentDocumentoToAta < ActiveRecord::Migration
  def self.up
    change_table :ata do |t|
      t.attachment :documento
    end
  end

  def self.down
    remove_attachment :ata, :documento
  end
end
