class DiagnosticProcedure < ApplicationRecord
  belongs_to :patient

  validates :description, presence: true
  validates :moment, presence: true

  def time
    moment.strftime('%l:%M %P').squish
  end

  def detail
    [description, 'at', time].join(' ')
  end
end
