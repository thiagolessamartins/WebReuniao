class CreateSugestaoItemPauta < ActiveRecord::Migration
  def change
    create_table :sugestao_item_pauta do |t|
      t.string :aprovar
      t.string :motivoSugestao
      t.string :motivoReprovar
      t.references :pessoa, index: true
      t.references :reuniao, index: true
      t.references :questao, index: true

      t.timestamps
    end
  end
end
