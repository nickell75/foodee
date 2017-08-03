class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users |t| do 
  		t.string	:first_name
  		t.string	:last_name
  		t.string 	:email
  		t.string 	:encrypted_password

  		t.timestamps
  	end
  end
end
