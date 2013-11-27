class Account < ActiveRecord::Base
  
  has_many :users, dependent: :destroy
  has_many :groups, dependent: :destroy
  
  scope :active, -> { where(:active => false) }
  
  validates :name, presence: true, uniqueness: true

  def deactivate!
    Account.transaction do
      update_attribute(:active, false)
      groups.map(&:deactivate!)
      users.map(&:deactivate!)
    end
  end

  def activate!
    Account.transaction do
      update_attribute(:active, true)
      groups.map(&:activate!)
      users.map(&:activate!)
    end
  end
  
end
