class DreamPolicy < ApplicationPolicy
  def create?
    user == record.user || user.admin?
  end

  def new?
    create?
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

  def realized?
    edit?
  end

  def destroy?
    edit?
  end
end
