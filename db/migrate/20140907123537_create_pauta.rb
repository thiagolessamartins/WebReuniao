class CreatePauta < ActiveRecord::Migration
  def change
    create_table :pauta do |t|
      t.string :titulo
      t.date :data
      t.string :status

      t.timestamps
    end
  end
end
