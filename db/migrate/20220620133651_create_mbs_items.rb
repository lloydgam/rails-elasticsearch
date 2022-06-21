class CreateMbsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :mbs_items do |t|
      t.integer :reference, :null =>  false
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.boolean :is_latest, :default =>  1
      t.string :description, :null => false, :limit => 255
      t.timestamps
    end
  end
end
