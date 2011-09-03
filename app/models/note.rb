class Note < ActiveRecord::Base
  attr_accessible :title, :body

  validates :title, :presence => true, :length => {:maximum => 255}
  validates :user, :presence => true

  scope :mine, lambda { |uid, provider| where(:uid => uid, :provider => provider) }

  belongs_to :user
end
