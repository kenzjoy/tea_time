class TeasSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :temperature, :brew_time
end
