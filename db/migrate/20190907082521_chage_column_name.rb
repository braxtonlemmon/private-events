class ChageColumnName < ActiveRecord::Migration[5.2]
	def change
		rename_column :events, :title, :description
  end
end
