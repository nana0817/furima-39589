class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :chinese_character_family_name, presence: true
  validates :chinese_character_first_name, presence: true
  validates :katakana_family_name, presence: true
  validates :katakana_first_name, presence: true
  validates :date_of_birth, presence: true
end
