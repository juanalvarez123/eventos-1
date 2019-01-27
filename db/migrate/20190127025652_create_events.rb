class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :location
      t.string :address
      t.string :event_type
      t.date :date_init
      t.date :date_end

      t.timestamps
    end
  end
end
