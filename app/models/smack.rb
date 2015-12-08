class Smack < ActiveRecord::Base
    validates :user_id, :presence => true
    validates :league_id, :presence => true

    has_many :likes, :dependent => :destroy
    has_many :dislikes, :dependent => :destroy
    has_many :responses, :dependent => :destroy
    belongs_to :user
    belongs_to :league

    mount_uploader :image, ImageUploader

end
