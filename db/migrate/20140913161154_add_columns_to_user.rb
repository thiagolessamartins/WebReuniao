class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_reference :users, :pessoa, index: true
  end
end
