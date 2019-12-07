require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map { |customer_hash| Customer.new(customer_hash)}
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
          INNER JOIN tickets ON tickets.films_id = films.id
          WHERE customer_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|film_hash| Film.new(film_hash)}
  end

  def buy()
    sql = "SELECT films.price FROM films
          INNER JOIN tickets on tickets.films_id = films.id
          WHERE customer_id = $1;"
    values = [@id]
    result = SqlRunner.run(sql,values)
    price_array = result.map {|hash| hash['price'].to_i}
    price = price_array.sum
    @funds -= price
  end

  def tickets()
    sql = "SELECT films.* FROM films
          INNER JOIN tickets ON tickets.films_id = films.id
          WHERE customer_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.count
  end





end
