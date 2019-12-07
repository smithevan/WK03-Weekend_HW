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

customer3 = Customer.new({
  "name" => "Maeve",
  "funds" => 120
  })

customer4 = Customer.new({
  "name" => "Alexandra",
  "funds" => 110
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()

film1 = Film.new({
  "title" => "Avengers",
  "price" => 10
  })

film2 = Film.new({
  "title" => "Godfather",
  "price" => 8
  })

film3 = Film.new({
  "title" => "Matrix",
  "price" => 12
  })

film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "films_id" => film1.id
  })

ticket2 = Ticket.new({
  "customer_id" => customer2.id,
  "films_id" => film2.id
  })

ticket3 = Ticket.new({
  "customer_id" => customer1.id,
  "films_id" => film3.id
  })

ticket4 = Ticket.new({
  "customer_id" => customer3.id,
  "films_id" => film1.id
  })

ticket5 = Ticket.new({
  "customer_id" => customer4.id,
  "films_id" => film1.id
  })

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()










binding.pry
nil
