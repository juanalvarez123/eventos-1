class Event < ApplicationRecord
  validates :name, presence: { message: "El nombre es obligatorio" }
  validates :category, presence: true
  validates :location, presence: { message: "El lugar es obligatorio" }
  validates :address, presence: { message: "La dirección es obligatoria" }
  validates :event_type, presence: true
  validates :date_init, presence: { message: "La fecha de inicio es obligatoria" }
  validates :date_end, presence: { message: "La fecha de finalización es obligatoria" }
  validate :dateInitMustBeGreaterThanDateEnd

  def dateInitMustBeGreaterThanDateEnd
    if !date_init.blank? && !date_end.blank? && date_init >= date_end
      errors.add(:date_init, "La fecha de inicio debe ser mayor a la fecha de finalización")
    end
  end
end
