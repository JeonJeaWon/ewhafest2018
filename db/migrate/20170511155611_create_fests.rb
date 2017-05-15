class CreateFests < ActiveRecord::Migration
  def change
    create_table :fests do |t|
      t.integer :date
      t.string :place
      t.string :name
      t.text :detail
      t.integer :booth_num
      
      t.timestamps null: false
    end
  end
end
