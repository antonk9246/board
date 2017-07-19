class AdsItemPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == ads_item.user
  end

  def edit?
    update?
  end

  def destroy?
    return true if user.try(:admin?)
    return true if user.present? && user == ads_item.user
  end

  def set_approve?
    return true if user.try(:admin?)
  end

  private

  def ads_item
    record
  end
end
