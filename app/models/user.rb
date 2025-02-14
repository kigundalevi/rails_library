class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add relationships
  has_many :borrowings
  has_many :books, through: :borrowings

  # Add admin? method
  def admin?
    admin
  end
end