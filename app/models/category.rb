class Category < ApplicationRecord
  CATEGORIES = %(travel adventure sport art music cinema culture study mode technology challenges other)

  has_many :dreams
end
