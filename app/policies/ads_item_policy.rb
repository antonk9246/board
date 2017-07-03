class AdsItemPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present? && user == ads_item.user
  end
 
  def destroy?
    return true if user.present? && user == ads_item.user
  end
 
  private
 
    def ads_item
      record
    end
end