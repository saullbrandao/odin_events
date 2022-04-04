class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
