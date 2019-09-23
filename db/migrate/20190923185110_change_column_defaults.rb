class ChangeColumnDefaults < ActiveRecord::Migration[5.2]
	def change
		change_column :invitations, :pending,  :boolean, default: 1
		change_column :invitations, :accepted, :boolean, default: 0
		change_column :invitations, :rejected, :boolean, default: 0
  end
end
