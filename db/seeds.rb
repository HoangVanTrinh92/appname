Product.delete_all
Product.create! id: 1, name: "Banana", price: 9000, active: true
Product.create! id: 2, name: "Apple", price: 14000, active: true
Product.create! id: 3, name: "Carton of Strawberries", price: 16500, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
