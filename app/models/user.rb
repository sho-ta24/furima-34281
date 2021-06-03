class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format:{with:/\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z\d]+\z/}
    with_options presence: true do
    validates :nickname
    validates :last_name, format:{ with:/\A[あ-んア-ン一-龥]+\z/}
    validates :first_name, format:{ with:/\A[あ-んア-ン一-龥]+\z/}
    validates :last_name_kana, format:{ with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format:{ with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end
end
