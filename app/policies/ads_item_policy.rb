class AdsItemPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.try(:admin?)
        scope.where(:aasm_state => [:approved, :new])
      else
        scope.where(:aasm_state => :approved)
      end
    end
  end

  def index?
    true
  end

  def show?
    ads_item.approved? == true || user.try(:admin?) || user == ads_item.user
  end

  def search
    true
  end

  def create?
    user.present?
  end

  def update?
    true if user.present? && user == ads_item.user
  end

  def edit?
    update?
  end

  def destroy?
    true if user.try(:admin?) || (user.present? && user == ads_item.user)
  end

  def to_new?
    true if user.present? && user == ads_item.user && ads_item.aasm_state == 'draft'
  end

  def approve?
    true if user.try(:admin?) && ads_item.aasm_state == 'new'
  end

  def decline?
    true if user.try(:admin?) && ads_item.aasm_state == 'new'
  end 

  def return?
    true if user.present? && user == ads_item.user && ads_item.aasm_state == 'new'
  end 
  
  private

  def ads_item
    record
  end
end
