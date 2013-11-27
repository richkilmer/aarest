class Service < ActiveRecord::Base

  validates :name,  presence: true, uniqueness: true
  validates :key,   presence: true
  validates :host,  presence: true
  
  has_many :grants
  
  def operations?
    self.name == "ops"
  end

end
