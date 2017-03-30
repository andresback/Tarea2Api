class User < ApplicationRecord
  validates :nombre, presence: true, allow_nil: false, allow_blank: false
  validates :usuario, presence: true, allow_nil: false, allow_blank: false

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at]
    super(options)
  end

end
