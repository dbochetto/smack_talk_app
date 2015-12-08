class Response < ActiveRecord::Base
  validates :user_id, :presence => true
  # validates :smack_id, :presence => true
  validate :smack_or_pub

  has_many :likes
  has_many :dislikes
  belongs_to :user
  belongs_to :smack
  belongs_to :publication

  def smack_or_pub
    if smack_id.nil? && publication_id.nil?
      errors.add(:base, 'You must respond to a smack or a publication')
    end
  end

end
