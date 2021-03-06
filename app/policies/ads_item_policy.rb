class AdsItemPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.try(:admin?)
        scope.where(aasm_state: %i[approved new]).includes(:user, :category)
      else
        scope.approved_scope.includes(:user, :category)
      end
    end
  end

  def index?
    true
  end

  def show?
    ads_item.approved? == true || user.try(:admin?) || user == ads_item.user
  end

  def search?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
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
    true if user.present? && user == ads_item.user &&
            ads_item.aasm_state == 'draft'
  end

  def approve?
    true if user.try(:admin?) && ads_item.aasm_state == 'new'
  end

  def decline?
    true if user.try(:admin?) && ads_item.aasm_state == 'new'
  end

  def return?
    true if user.present? && user == ads_item.user &&
            ads_item.aasm_state == 'new'
  end

  def permitted_attributes
    if user.try(:admin?)
      [:title, :text, :category_id, :comment, { images: [] },
       :approval_date, :user_id, :aasm_state]
    elsif user.present?
      [:title, :text, :category_id, { images: [] }]
    end
  end

  private

  def ads_item
    record
  end
end
