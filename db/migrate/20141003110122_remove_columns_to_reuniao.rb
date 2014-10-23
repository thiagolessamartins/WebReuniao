class RemoveColumnsToReuniao < ActiveRecord::Migration
  def change
    remove_column :reuniaos, :categoria, :string
  end
end
