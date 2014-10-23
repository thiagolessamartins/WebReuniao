class CreateQuestaos < ActiveRecord::Migration
  def change
    create_table :questaos do |t|
      t.string :titulo
      t.date :data
      t.string :status
      t.text :solucao
      t.references :pessoa, index: true

      t.timestamps
    end
  end
end
