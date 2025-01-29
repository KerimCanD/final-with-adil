require 'shrine'
require 'shrine/storage/file_system'

Shrine.plugin :download_endpoint, prefix: 'attachments'
Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads') # permanent
}

Shrine.plugin :activerecord
