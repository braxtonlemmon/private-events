class AddColumnsToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :pending, :boolean
    add_column :invitations, :accepted, :boolean
    add_column :invitations, :rejected, :boolean
  end
end
