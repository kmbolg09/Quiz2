class AddUserReferences < ActiveRecord::Migration
  def change
    add_reference :ideas, :user, idex: true
    
  end
end
