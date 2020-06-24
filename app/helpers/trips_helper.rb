module TripsHelper

	def days_out_by_month(start_date, end_date)
	  distance_of_time_in_words(start_date, end_date)
	end

	def trip_length
	  distance_of_time_in_words(@trip.start_date, ( @trip.end_date + 1.day ))
	end

end
