require 'date'
user1 = User.create(username: "Archana", email: "archana@gmail.com", password: "x", monthly_budget: 700.00)
user2 = User.create(username: "Brian", email: "brian@gmail.com", password: "x", monthly_budget: 5000.00)
user3 = User.create(username: "Darryl", email: "darryl@gmail.com", password: "x", monthly_budget: 1000.00)
user4 = User.create(username: "Katie", email: "katie@gmail.com", password: "x", monthly_budget: 2500.00)

purchase1 = Purchase.new(description: "groceries", amount: 345.34, date_purchased: '01-01-2017')
purchase1.user = user1
purchase1.save

purchase2 = Purchase.new(description: "rainbow powder", amount: 360.64, date_purchased: '10-21-2017')
purchase2.user = user1
purchase2.save

purchase3 = Purchase.new(description: "lizard king", amount: 800.86, date_purchased: '10-29-2017')
purchase3.user = user1
purchase3.save

purchase4 = Purchase.new(description: "dance party", amount: 750.08, date_purchased: '10-25-2017')
purchase4.user = user1
purchase4.save

purchase5 = Purchase.new(description: "movie ticket", amount: 300.54, date_purchased: '09-04-2017')
purchase5.user = user1
purchase5.save

purchase6 = Purchase.new(description: "good dreams", amount: 20.34, date_purchased: '10-22-2017')
purchase6.user = user2
purchase6.save

purchase7 = Purchase.new(description: "pants", amount: 300.32, date_purchased: '10-23-2017')
purchase7.user = user3
purchase7.save

purchase8 = Purchase.new(description: "puppies", amount: 300.41, date_purchased: '10-21-2017')
purchase8.user = user3
purchase8.save

purchase9 = Purchase.new(description: "gravitational waves", amount: 344.45, date_purchased: '10-20-2017')
purchase9.user = user3
purchase9.save

purchase10 = Purchase.new(description: "NYC rent", amount: 1.22, date_purchased: '10-26-2017')
purchase10.user = user4
purchase10.save

purchase11 = Purchase.new(description: "saturn ring", amount: 83.34, date_purchased: '10-25-2017')
purchase11.user = user4
purchase11.save

purchase12 = Purchase.new(description: "subway pass", amount: 23.00, date_purchased: '10-23-2017')
purchase12.user = user4
purchase12.save
