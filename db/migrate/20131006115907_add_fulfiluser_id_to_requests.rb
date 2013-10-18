class AddFulfiluserIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :fulfiluser_id, :integer
  end
end
