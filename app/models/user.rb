class User < ApplicationRecord
  validates :name, presence: { message: "El nombre es obligatorio"}
  validates :email, presence: { message: "El correo electrónico es obligatorio" }
  validates :password, presence: { message: "La contraseña es obligatoria" }
end
