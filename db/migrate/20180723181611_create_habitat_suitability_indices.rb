class CreateHabitatSuitabilityIndices < ActiveRecord::Migration[5.2]
  def up
    (query = '') << <<-SQL
        CREATE TABLE habitat_suitability_indices (
                                 year INTEGER PRIMARY KEY,
                                 map_url text NOT NULL,
                                 created_at timestamp with time zone NOT NULL,
                                 updated_at timestamp with time zone NOT NULL
                                 );
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    (query = '') << <<-SQL
        DROP TABLE habitat_suitability_indices;
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

end
