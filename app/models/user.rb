class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :username, :presence => true

         has_many :publications, :dependent => :destroy
         has_many :smacks, :dependent => :destroy
         has_many :likes, :dependent => :destroy
         has_many :dislikes, :dependent => :destroy
         has_many :responses, :dependent => :destroy
         has_many :memberships, :dependent => :destroy

         mount_uploader :avatar, AvatarUploader

end
