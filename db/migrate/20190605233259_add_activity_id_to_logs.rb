class AddActivityIdToLogs < ActiveRecord::Migration[5.2]
  def change
      add_reference :logs, :activity, foreign_key: true
  end
end
