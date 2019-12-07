require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :showtime, :films_id

  def initialize (options)
    @id = options["id"].to_i if options["id"]
    @showtime = options["showtime"]
    @films_id = options["films_id"].to_i
  end

  def save()
    sql = "INSERT INTO screenings (showtime, films_id) VALUES ($1, $2) RETURNING id;"
    values = [@showtime, @films_id]
    @id = SqlRunner.run(sql, values)[0]["id"]
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    results = SqlRunner.run(sql)
    return results.map { |screening_hash| Screening.new(screening_hash)}
  end

end
