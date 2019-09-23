class ChangeColumnName2 < ActiveRecord::Migration[5.2]
	def change
		rename_column :invitations, :attended_attended_event_id, :attended_event_id
  end
end
