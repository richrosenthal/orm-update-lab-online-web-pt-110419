require_relative "../config/environment.rb"

class Student

attr_accessor :id, :name, :grade

def initialize(id = nil, name, grade)
  @id = id 
  @name = name
  @grade = grade 
end 

 def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    )
    SQL

    DB[:conn].execute(sql)
  end
  
 def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end
 
  def self.find_by_name(name)
       sql = <<-SQL
      SELECT *
      FROM students
      WHERE name = ?
      LIMIT 1
    SQL
 
    DB[:conn].execute(sql, name).map do |row|
      self.new_from_db(row)
    end.first
  end
  

  
  


  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
