class User < ActiveRecord::Base
  
  belongs_to :account
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships

  validates :email, presence: true, uniqueness: true

  def deactivate!
    update_attribute(:active, false)
  end

  def activate!
    update_attribute(:active, true)
  end

end
