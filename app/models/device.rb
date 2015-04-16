class Device < ActiveRecord::Base
  belongs_to :branch
  belongs_to :category
  has_one :device_image
  # 设备状态，1－新增；2－副本；11－正本；12－有副本；14－在修；15－停用
  #
end
