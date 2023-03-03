class CustomerSubscriptionsSerializer
  include JSONAPI::Serializer

  # set_id {nil}
  # attributes :customer_id, :subscription_id, :title, :price, :status, :frequency
  attributes :customer_id, :subscription_id, :status, :frequency
end
