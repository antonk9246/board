class AdsItemPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.try(:admin?)
        scope.all
      else
        scope.where(approved: true,
                    approval_date: (Time.now - 3.day)..Time.now)
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
