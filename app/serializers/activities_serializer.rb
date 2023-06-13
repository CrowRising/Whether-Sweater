class ActivitiesSerializer
  include JSONAPI::Serializer
  set_id { nil }
  set_type :activities
  attributes :type, :destination, :forecast, :activities
end