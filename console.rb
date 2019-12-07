require ("pry")

require_relative ("./models/customer")
require_relative ("./models/film")
require_relative ("./models/ticket")


Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({
  "name" => "Jim",
  "funds" => 100
  })

customer2 = Customer.new({
  "name" => "Robert",
  "funds" => 50
  })

customer1.save()
customer2.save()

film1 = Film.new({
  "title" => "Avengers",
  "price" => 10
  })

film2 = Film.new({
  "title" => "Godfather",
  "price" => 8
  })

film1.save()
film2.save()

ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id
  })

ticket1.save()










binding.pry
nil
