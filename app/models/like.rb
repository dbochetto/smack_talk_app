class Like < ActiveRecord::Base
  validates :user_id, :presence => true, :uniqueness => { :scope => [:smack_id, :response_id] }
  validate :smack_or_resp

  belongs_to :user
  belongs_to :smack
  belongs_to :response


  def smack_or_resp
    if smack_id.nil? && response_id.nil?
      errors.add(:base, 'You must like a smack or a response')
    end
  end
end
