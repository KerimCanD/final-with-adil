class Storage::Folder < ApplicationRecord
  self.table_name = "folders"
  has_one :storable, as: :storable, dependent: :destroy
  has_many :children, class_name: "Storable", foreign_key: "parent_id"

end