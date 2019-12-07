require_relative("../db/sql_runner")

class Ticket

  attr_reader :id, :customer_id, :films_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["customer_id"]
    @films_id = options["film_id"]
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, films_id) VALUES ($1, $2) RETURNING id;"
    values = [@customer_id, @films_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

end
