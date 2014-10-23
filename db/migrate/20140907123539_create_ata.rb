class CreateAta < ActiveRecord::Migration
  def change
    create_table :ata do |t|
      t.string :status
      t.string :pdfAta

      t.timestamps
    end
  end
end
