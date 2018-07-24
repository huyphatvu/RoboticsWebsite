class CreateSwanLakes < ActiveRecord::Migration[5.2]
  def up
    (query = "") << <<-SQL
        CREATE TABLE swan_lakes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          data_date DATE NOT NULL,
          environment_url TEXT,
          biology_url TEXT,
          created_at TIMESTAMP WITH TIME ZONE NOT NULL,
          updated_at TIMESTAMP WITH TIME ZONE NOT NULL
        );
    SQL

    ActiveRecord::Base.connection.execute(query);
  end

  def down
    (query ='') << <<-SQL
      DROP TABLE swan_lakes;
    SQL
    ActiveRecord::Base.connection.execute(query)
  end
end
