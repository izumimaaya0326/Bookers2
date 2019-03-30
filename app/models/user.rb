class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username,uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  has_many :books, dependent: :destroy

   validates :introduction, length: { maximum: 50 }
   validates :username, length: { in: 2..20 }
   validates :username, presence: true

 def email_required?
   false
 end
 def email_changed?
   false
 end

end
