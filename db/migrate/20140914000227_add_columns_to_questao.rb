class AddColumnsToQuestao < ActiveRecord::Migration
  def change
    add_reference :questaos, :user, index: true
  end
end
