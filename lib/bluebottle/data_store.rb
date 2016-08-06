module BlueBottle

  class DataStore
    def initialize
      @store = {
        customers: [],
        coffees: [],
        subscriptions: []
      }
    end

    def customers
      @store[:customers]
    end

    def add_coffee(coffee)
      @store[:coffees] << coffee
    end

    def add_customer(customer)
      @store[:customers] << customer
    end
    
    def add_subscription(subscription)
      @store[:subscriptions] << subscription
    end
    
    def subscriptions_for_customer(customer)
      @store[:subscriptions].select { |s| s.customer_id == customer.id }
    end
    
    def subscriptions_for_customer_with_status(customer, status)
      subscriptions_for_customer(customer).select { |s| s.send("#{status}?".to_sym) }
    end
    
    def subscriptions_for_coffee(coffee)
      @store[:subscriptions].select { |s| s.coffee_id == coffee.id }
    end
  end
end
