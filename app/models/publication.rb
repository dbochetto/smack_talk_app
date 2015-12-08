class Publication < ActiveRecord::Base
    validates :user_id, :presence => true
    validates :league_id, :presence => true

    has_many :responses, :dependent => :destroy
    belongs_to :user
    belongs_to :league

end
