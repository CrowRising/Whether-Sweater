# frozen_string_literal: true

class UsersSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key
end
