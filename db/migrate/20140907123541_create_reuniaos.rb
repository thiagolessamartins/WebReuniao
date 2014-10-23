class CreateReuniaos < ActiveRecord::Migration
  def change
    create_table :reuniaos do |t|
      t.string :titulo
      t.date :data
      t.time :horaInicio
      t.time :horaFim
      t.string :status
      t.references :local, index: true
      t.references :pautum, index: true
      t.references :atum, index: true
      t.string :categoria

      t.timestamps
    end
  end
end
