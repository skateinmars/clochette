class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.timestamps

      t.references :project, null: false

      t.string :event_type, null: false

      t.string :action_name, null: false
    end
  end
end
