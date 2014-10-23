class AddColumnsToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :opcao, :integer
  end
end
