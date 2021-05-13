class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :task, optional: true
  belongs_to :comment, optional: true

  enum status: %i[active in_progress done]
  include EnumTranslatable

  def allowed_to_take
    if !Order.where(implementer_id: current_user, status: 1).present?
      true
    else
      false
    end
  end
end
