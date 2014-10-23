class CreateParticipacaos < ActiveRecord::Migration
  def change
    create_table :participacaos do |t|
      t.string :contribuicao
      t.references :pessoa, index: true
      t.references :reuniao, index: true

      t.timestamps
    end
  end
end
