class LowerSortName < ActiveRecord::Migration
  def up
    execute "CREATE INDEX artist_lower_sort_name ON artists (lower(left(sort_name, 1)))"
  end

  def down
    execute "DROP INDEX artist_lower_sort_name"
  end
end
