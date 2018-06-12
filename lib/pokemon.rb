class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
    #db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_found = db.execute("SELECT * FROM pokemon WHERE pokemon.id = '#{id}'")
    Pokemon.new(pokemon_found[0], pokemon_found[1], pokemon_found[2])
  end
end
