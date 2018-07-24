class CreateParticipants < ActiveRecord::Migration[5.2]
  def up
    (query ='') << <<-SQL
      CREATE TABLE participants(
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         first_name text, 
         last_name text,
         email text,
         state_name text,
         created_at TIMESTAMP WITH TIME ZONE NOT NULL,
         updated_at TIMESTAMP WITH TIME ZONE NOT NULL
      );
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    (query ='') << <<-SQL
      DROP TABLE participants;
    SQL
    ActiveRecord::Base.connection.execute(query)
  end
end
