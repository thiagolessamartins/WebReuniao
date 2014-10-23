class AddColumnsToReuniao < ActiveRecord::Migration
  def change
    add_reference :reuniaos, :category, index: true
  end
end
