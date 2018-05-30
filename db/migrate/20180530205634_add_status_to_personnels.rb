class AddStatusToPersonnels < ActiveRecord::Migration[5.2]
  def change
    add_column :personnels, :status, :boolean, default: true
  end
end
