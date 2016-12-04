class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentable_id, :integer, index: true
    add_column :comments, :commentable_type, :string, index: true
  end
end
