require_relative("../db/sql_runner")

def Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options["id"].to_i it options["id"]
    @customer_id = options["customer_id"]
    @film_id = options["film_id"]
  end

  def save()
    sql = "INSERT INTO ticket (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

end
