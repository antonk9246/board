class AdsItemPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end
    
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true if user.try(:admin?)
  end

  def update?
    true if user.try(:admin?)
  end

  def edit?
    true if user.try(:admin?)
  end

  def destroy?
    true if user.try(:admin?)
  end
end
