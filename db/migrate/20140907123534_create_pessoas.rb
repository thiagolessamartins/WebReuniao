class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.integer :cpf
      t.string :uf
      t.string :cidade
      t.string :endereco
      t.string :email 
      t.integer :matricula

      t.timestamps
    end 
  end
end
