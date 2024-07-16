class CreateSpecProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :spec_products do |t|

      t.timestamps
    end
  end
end
