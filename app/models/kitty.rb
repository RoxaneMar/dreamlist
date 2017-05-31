class Kitty < ApplicationRecord
  belongs_to :dream
  has_many :contributors

  def total_contribution    
    # contributors.sum(:amount)
    contribution = 0
    self.contributors.each do |contributor|
      contribution += contributor.amount 
    end  
    return contribution
  end  
end
