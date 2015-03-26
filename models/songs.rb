ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
class Song < ActiveRecord::Base

end
