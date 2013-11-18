class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.timestamps

      t.string :uid, limit: 32, null: false

      t.string :name, null: false
    end

    add_index :projects, :uid, unique: true
  end
end
