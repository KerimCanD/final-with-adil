# frozen_string_literal: true

# This class is polymorhpic related class for both Storage::File and Storage::Folder classes
class Storable < ApplicationRecord
  belongs_to :user
  belongs_to :storable, polymorphic: true
  belongs_to :parent, class_name: 'Storable', optional: true
  scope :root, -> { where(parent_id: nil) }
end
