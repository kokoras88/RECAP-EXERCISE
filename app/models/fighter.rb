class Fighter < ApplicationRecord
  has_many :set_fighter
  has_one_attached :photo
end
