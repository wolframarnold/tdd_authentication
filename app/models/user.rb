class User < ActiveRecord::Base

  devise :omniauthable

  validates_presence_of :uid, :provider

  scope :with_twitter_uid, lambda {|uid| where(:uid => uid)}

  has_many :notes, :dependent => :destroy
end
