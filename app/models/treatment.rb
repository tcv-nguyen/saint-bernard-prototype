class Treatment < ApplicationRecord
  belongs_to :patient

  validates :description, presence: true
  validates :necessity, presence: true

  def detail
    [description, 'to', necessity].join(' ')
  end
end
