# frozen_string_literal: true

module Storage
  # This class is to record the files uploaded by the client. It uses Shrine for file uploading.
  class File < ApplicationRecord
    self.table_name = 'files'
    include Shrine::Attachment(:file)
    has_one :storable, as: :storable, dependent: :destroy
  end
end
