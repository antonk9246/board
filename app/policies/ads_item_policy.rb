class AdsItemPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(approved: 't')
      end
    end
  end

  def index?
    true
  end

  def show?
    ads_item.approved? == true || user.try(:admin?) || user == ads_item.user
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
    return true if user.try(:admin?) || (user.present? && user == ads_item.user)
  end

  def set_approve?
    return true if user.try(:admin?)
  end

  private

  def ads_item
    record
  end
end
