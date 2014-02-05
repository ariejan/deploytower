class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.belongs_to :target, null: false

      t.string     :branch
      t.string     :revision
      t.datetime   :started_at
      t.datetime   :finished_at
      t.string     :state, default: 'queued'

      t.timestamps
    end
  end
end
