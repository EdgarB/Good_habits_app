class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
        t.string :description
        t.datetime :done_at
        
      t.timestamps
    end
  end
end
