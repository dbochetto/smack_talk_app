class Membership < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :league_id, :presence => true

  belongs_to :user
  belongs_to :league

end
