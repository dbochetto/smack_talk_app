class League < ActiveRecord::Base
  validates :name, :presence => true

  has_many :publications, :dependent => :destroy
  has_many :smacks, :dependent => :destroy
  has_many :responses, :through => :smacks
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  belongs_to :commissioner, :class_name => "User", :foreign_key => "user_id"
end
