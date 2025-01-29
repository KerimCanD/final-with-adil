class StorableSerializer
  include JSONAPI::Serializer
  attributes :id, :storable_type, :storable_id, :parent_id, :user_id, :children

  def children
    object.children.map do |child|
      StorableSerializer.new(child)
    end
  end
end
