class CreateSpecUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :spec_users do |t|

      t.timestamps
    end
  end
end
