class AddBaseAttributesToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :heroku_app_name, :string
    add_column :targets, :heroku_git_remote, :string
    add_column :targets, :git_remote, :string
    add_column :targets, :git_default_branch, :string
    add_column :targets, :url, :string
  end
end
