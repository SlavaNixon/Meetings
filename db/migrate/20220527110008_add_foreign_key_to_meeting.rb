class AddForeignKeyToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :meetings, :users
  end
end
