class User < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :profession
end
