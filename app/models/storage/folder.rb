# frozen_string_literal: true

module Storage
  # This class is used for recording the folders created by client.
  class Folder < ApplicationRecord
    self.table_name = 'folders'
    has_one :storable, as: :storable, dependent: :destroy
    has_many :children, class_name: 'Storable', foreign_key: 'parent_id', dependent: :destroy
  end
end
