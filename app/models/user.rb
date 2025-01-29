class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :storables, dependent: :destroy
  has_many :folders, through: :storables, source: :storable, source_type: 'Storage::Folder'
  has_many :files, through: :storables, source: :storable, source_type: 'Storage::File'

  validates :email, presence: true, uniqueness: true
  validates :secret_key, presence: true, on: :update
  validate :secret_key_not_changed, on: :update
  before_create :generate_secret_key

  private

  def generate_secret_key
    self.secret_key = SecureRandom.hex(16)
  end

  def secret_key_not_changed
    errors.add(:secret_key, 'Change of secret key is not allowed!') if secret_key_changed? && persisted?
  end
end
