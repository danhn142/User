class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
