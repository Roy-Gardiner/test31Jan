class Array

	def inj  

	  return nil if self[0].nil?
		bucket = self[0]
		self[1..-1].each_with_index do |element,i| 
			bucket = yield(bucket,element)
		end

		bucket
	end	

	def bollocks
		
		"bollocks to you"
	end
end

class Bill < Array

  def henry
  	return 'No more swearing, please'
  end 
end

