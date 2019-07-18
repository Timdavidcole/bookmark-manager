require 'pg'

def persisted_data(table:, id:)
  if table == 'comments'
    DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
  else
    DatabaseConnection.query("SELECT * FROM #{table} WHERE bookmark_id = '#{id}';")
  end
end
