class CreateTripComments < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
