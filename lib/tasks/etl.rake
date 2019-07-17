# Extraction, Transformation and Loading
# Taking the data from the existing database and moving it into the new database
# https://stuff-things.net/2016/11/02/importing-legacy-data-into-your-rails-app/

# Require the PostgreSQL Gem
require 'pg'


namespace(:ng) do
	namespace(:move) do

		#
		# Testing the waters
		#
		desc "Migrate Profiles"
		task :profiles => :environment do
			begin

				pg_db = PG.connect :dbname => 'nextgen-database-backup', :user => 'postgres', :password => '!W4i5p901'

				rs = pg_db.exec "SELECT * FROM public.person_translations"

				rs.each do |row|
					puts "%s %s %s" % [ row['id'], row['name'], row['first_name'] ]
				end

			rescue PG::Error => e

				puts e.message

			ensure

				rs.clear if rs
				pg_db.close if pg_db

			end
		end
	end
end
