class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :rsvp_code
      t.string :party_name
      t.integer :num_guests
      t.integer :num_nights
      t.integer :child
      t.integer :rsvp_guests
      t.integer :rsvp_nights
      t.string :email
      t.text :guest_names
      t.text :special_accom

      t.timestamps null: false
    end
  end
end
