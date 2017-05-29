class ProfilePolicy < ApplicationPolicy
  def dreams?
    true
  end

  def show?
    true
  end

  def edit?
    user == record.user || user.admin?
  end

  def update?
    edit?
  end
end
