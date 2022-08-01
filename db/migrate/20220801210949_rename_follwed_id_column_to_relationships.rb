class RenameFollwedIdColumnToRelationships < ActiveRecord::Migration[7.0]
  def change
    rename_column :relationships, :followed_id, :following_id
  end
end
