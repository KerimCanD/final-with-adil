class Storage::File < ApplicationRecord
  self.table_name = "files"
  include Shrine::Attachment(:file)
  has_one :storable, as: :storable, dependent: :destroy
end