class AddIsOpenAttrToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :isopen, :boolean, null:false, default:true
  end
end
