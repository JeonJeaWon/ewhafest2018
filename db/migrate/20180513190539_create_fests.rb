class CreateFests < ActiveRecord::Migration
  def change
    create_table :fests do |t|
      t.integer :date
      t.string :place
      t.integer :booth_num
      t.string :name
      t.integer :sold_out
      t.integer :password
      t.text :detail

      t.timestamps null: false
    end
  end
end
