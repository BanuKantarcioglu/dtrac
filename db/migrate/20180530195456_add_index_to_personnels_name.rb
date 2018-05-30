class AddIndexToPersonnelsName < ActiveRecord::Migration[5.2]

    def change
      add_index :personnels, :name, unique: true
    end

end
