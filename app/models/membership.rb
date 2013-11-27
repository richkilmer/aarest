class Membership < ActiveRecord::Base

  belongs_to :group
  belongs_to :user
  
  validates :user_id, :group_id, presence: true
  validates :group_id, uniqueness: {scope: :user_id}

end
