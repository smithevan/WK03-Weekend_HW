require ("pry")

require_relative ("./models/customer")
require_relative ("./models/film")
require_relative ("./models/ticket")

customer1 = Customer.new({
  "name" => "Jim",
  "funds" => 1000
  })

customer1.save()

film1 = Film.new({
  "title" => "Avengers",
  "price" => 10
  })

film1.save()

# ticket1 = Ticket.new({
#   "customer_id" => customer1.id,
#   "film_id" => film1.id
#   })









binding.pry
nil
