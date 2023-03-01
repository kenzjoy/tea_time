require 'csv'

namespace :csv_load do
  task all: %i[customers subscriptions teas]

  task customers: :environment do
    CSV.foreach('./db/data/customers.csv', headers: true) do |row|
      Customer.find_or_create_by(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('customers')
  end

  task subscriptions: :environment do
    CSV.foreach('./db/data/subscriptions.csv', headers: true) do |row|
      Subscription.find_or_create_by(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('subscriptions')
  end

  task teas: :environment do
    CSV.foreach('./db/data/teas.csv', headers: true) do |row|
      Tea.find_or_create_by(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('teas')
  end
end
