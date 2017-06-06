class Kitty < ApplicationRecord
  belongs_to :dream
  has_many :contributors
  monetize :goal_amount_cents

  def reached?
    if self.total_contribution_public >= goal_amount && goal_amount > 0
      true
    else
      false
    end
  end

  def reveal
    contributors.each do |contributor|
      contributor.update(private: false)
    end
  end

  def total_contribution_public
    contribution = Money.new(0)
    self.contributors.paid.each do |contributor|
      if contributor.private
        contribution
      else
        contribution += contributor.price
      end
    end
    contribution
  end

  def total_contribution_private
    contribution = Money.new(0)
    self.contributors.paid.each do |contributor|
      if !contributor.private
        contribution
      else
        contribution += contributor.price
      end
    end
    contribution
  end

  # for green progress bar
  def contribution_avancement_public
    if total_contribution_public >= goal_amount
      100
    elsif goal_amount > 0
      (total_contribution_public / goal_amount)*100
    else
      100
    end
  end

  def contribution_avancement_private
    if total_contribution_private >= goal_amount
      100
    elsif goal_amount > 0
      (total_contribution_private / goal_amount)*100
    else
      100
    end
  end

  # for % of money pot reached
  def real_contribution_avancement
    if goal_amount > 0
      (total_contribution_public / goal_amount)*100
    else
      100
    end
  end

  def real_contribution_avancement_private
    if goal_amount > 0
      (total_contribution_private / goal_amount)*100
    else
      100
    end
  end

  # def contribution_avancement_revealed
  #   if goal_amount > 0
  #     (total_contribution.to_f / goal_amount)*100
  #   else
  #     100
  #   end
  # end

  def public_contributors_count
    total_contributors = 0
    self.contributors.each do |contributor|
      total_contributors += 1 if !contributor.private
    end
    total_contributors
  end

  def secret?
    if total_contribution_private > 0
      self.contributors.any? { |contributor| contributor.private }
    end
  end

  def different_user_contributors
    contributors.map{ |contributor| contributor.user }.uniq
  end

end
