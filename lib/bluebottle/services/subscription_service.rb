module BlueBottle
  module Services
    class SubscriptionService

      def initialize(data_store)
        @data_store = data_store
      end
      
      def add_subscription(customer, coffee)
        new_subscription = BlueBottle::Models::Subscription.new(customer.id, coffee.id)
        @data_store.add_subscription(new_subscription)
        new_subscription
      end
      
      def pause_subscription(subscription)
        raise "#{customer.full_name} does not have an active subscription to #{coffee.name}" unless subscription.active?
        subscription.pause
      end
      
      def cancel_subscription(subscription)
        subscription.cancel
      end
    end
  end
end
