class Group < ActiveRecord::Base
  
  belongs_to :account

  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
  has_many :grants

  scope :active, -> { where(:active => false) }

  validates :name, presence: true, uniqueness: true

  def deactivate!
    update_attribute(:active, false)
  end

  def activate!
    update_attribute(:active, true)
  end

end
