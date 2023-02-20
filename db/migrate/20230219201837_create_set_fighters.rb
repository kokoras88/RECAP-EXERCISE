class CreateSetFighters < ActiveRecord::Migration[7.0]
  def change
    create_table :set_fighters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
