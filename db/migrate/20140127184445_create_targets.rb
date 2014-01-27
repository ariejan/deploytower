class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
    end
  end
end
