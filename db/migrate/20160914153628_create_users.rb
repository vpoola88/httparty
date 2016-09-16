class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :currentUserId
      t.string :currentUnitId
      t.text   :answers

      t.timestamps
    end
  end
end
