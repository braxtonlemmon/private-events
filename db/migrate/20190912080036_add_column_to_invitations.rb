class AddColumnToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :host_id, :integer
  end
end
