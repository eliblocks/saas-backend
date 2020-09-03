class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.references :account, null: false, foreign_key: true
      t.integer :creator_id
      t.integer :completor_id

      t.timestamps

      t.index(:creator_id)
      t.index(:completor_id)
    end
  end
end
