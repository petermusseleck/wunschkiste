class AddFulfilidToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :fulfilid, :integer
  end
end
