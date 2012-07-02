class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.integer :user_id
      t.decimal :lat, :precision => 20, :scale => 7
      t.decimal :long, :precision => 20, :scale => 7 
      t.timestamps
    end
    add_index :establishments, :user_id
  end
end
