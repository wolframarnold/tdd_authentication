class Note < ActiveRecord::Base
  attr_accessible :title, :body

  validates :title, :presence => true, :length => {:maximum => 255}
  validates :uid, :presence => true, :length => {:maximum => 255}
  validates :provider, :presence => true, :length => {:maximum => 255}
end
