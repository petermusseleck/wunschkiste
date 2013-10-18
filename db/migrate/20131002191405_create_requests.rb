class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    t.string   "title"
    t.string   "description"
    t.string   "shop"
    t.string   "url"
    t.boolean  "taken"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "fulfilid"
    end
  end
end
