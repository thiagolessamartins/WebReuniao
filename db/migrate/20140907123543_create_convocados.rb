class CreateConvocados < ActiveRecord::Migration
  def change
    create_table :convocados do |t|
      t.string :motivoAusencia
      t.string :presenca
      t.string :status
      t.references :pessoa, index: true
      t.references :reuniao, index: true

      t.timestamps
    end
  end
end
