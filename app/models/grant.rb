class Grant < ActiveRecord::Base

  belongs_to :service
  belongs_to :group

end
