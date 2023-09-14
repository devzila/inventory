# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([
              { name: 'Admin', email: 'admin@inv.com', password: 'password' },
              { name: 'Manager', email: 'manager@inv.com', password: 'password' },
              { name: 'Purchase Head', email: 'purchase@inv.com', password: 'password' }
            ])

Item.create([
              { name: 'AFATINIB', description: 'AFATINIB', item_type: 0, quantity: 100, alert_quantity: 40 },
              { name: 'BARCITNIB', description: 'BARCITNIB', item_type: 0, quantity: 500, alert_quantity: 100 },
              { name: 'APREPITNIB', description: 'APREPITNIB', item_type: 1, quantity: 300, alert_quantity: 80 }
            ])