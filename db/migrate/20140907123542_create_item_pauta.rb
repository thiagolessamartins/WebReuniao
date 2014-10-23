class CreateItemPauta < ActiveRecord::Migration
  def change
    create_table :item_pauta do |t|
      t.text :observacao
      t.references :pautum, index: true
      t.references :questao, index: true

      t.timestamps
    end
  end
end
