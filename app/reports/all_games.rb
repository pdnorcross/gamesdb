class AllGames < ActiveRecord::Base
  def sql
    "Select
        name as 'Name',
        console_id as 'Console',
        developer as 'Developer',
        Publisher as 'Publisher',
        release_year as 'Year Released'
    FROM
        games
"
  end
end
