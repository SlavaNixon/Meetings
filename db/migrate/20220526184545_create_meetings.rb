class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :name, null: false
      t.string :place, null: false
      t.datetime :date
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
