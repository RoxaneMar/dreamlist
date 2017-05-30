class KittyPolicy < ApplicationPolicy
  def create?
    user == record.dream.user || user.admin?
  end

  def new?
    create?
  end

  def show?
    true
  end

  def edit?
    user == record.dream.user || user.admin?
  end

  def update?
    edit?
  end
end
