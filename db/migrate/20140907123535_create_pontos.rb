class CreatePontos < ActiveRecord::Migration
  def change
    create_table :pontos do |t|
      t.string :titulo
      t.date :data
      t.string :staus
      t.text :solucao
      t.references :questao, index: true

      t.timestamps
    end
  end
end
