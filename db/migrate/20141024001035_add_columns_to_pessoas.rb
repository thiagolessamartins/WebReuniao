class AddColumnsToPessoas < ActiveRecord::Migration
  def change
    add_column :pessoas, :role, :string
  end
end
