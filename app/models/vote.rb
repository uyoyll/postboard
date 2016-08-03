class Vote < ActiveRecord::Base
  #定義一個新的名稱 creator 對應user_id 跟UserModel
  belongs_to :creator, foreign_key: :user_id, class_name: "User" 

  #belongs_to :user
  belongs_to :voteable, polymorphic: true

 #驗證：creattor v_type v_id 為唯一  （限制一人只能投一票）
 validates_uniqueness_of :creator, scope: [:voteable_type, :voteable_id]
end