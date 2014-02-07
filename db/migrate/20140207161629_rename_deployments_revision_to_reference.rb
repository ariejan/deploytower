class RenameDeploymentsRevisionToReference < ActiveRecord::Migration
  def change
    rename_column :deployments, :revision, :reference
  end
end
