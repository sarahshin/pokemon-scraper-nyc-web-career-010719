class Pokemon

attr_accessor :id, :name, :type, :db

def self.save(name, type, db)
  sql = <<-SQL
    INSERT INTO pokemon (name, type) VALUES (?, ?);
  SQL
  db.execute(sql, [name, type])
end

def self.find(id_num, db)
  pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
  Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
end

def initialize(id: ,name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
end

def alter_hp(new_hp)
  sql = <<-SQL
    UPDATE pokemon SET hp = ? WHERE id = ?;
  SQL
  db.execute(sql, [new_hp, id])
end
end
