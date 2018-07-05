class CreateSourceReferences < ActiveRecord::Migration[5.2]
  def up
    (query = '') << <<-SQL
      CREATE TABLE source_references (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text text NOT NULL,
        created_at timestamp with time zone NOT NULl,
        updated_at timestamp with time zone NOT NULL
      );
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    (query = '') << <<-SQL
      DROP TABLE source_references;
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

end
