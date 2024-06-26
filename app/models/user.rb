class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :storables, dependent: :destroy
  has_many :folders, through: :storables, source: :storable, source_type: "Storage::Folder"
  has_many :files, through: :storables, source: :storable, source_type: "Storage::File"

  validates :email, presence: true, uniqueness: true
end
