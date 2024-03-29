class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :user_name
      t.references :meeting, null: false, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
