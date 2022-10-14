class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :address
      t.text :description
      t.float :latitude
      t.float :longitude
      t.boolean :post_type
      t.string :status
      t.boolean :reward
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
