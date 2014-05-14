class PrimeGenerator

	def get_range
		puts "Enter the 'from' range of prime numbers"
		from = gets.chomp.to_i
		puts "Enter the 'to' range of prime numbers"
		to = gets.chomp.to_i

		return generateprime(from,to) if to>from
		return generateprime(to,from) if from>to
	end

	def generateprime(from,to)
		from=from.to_i
		to=to.to_i
		prime=[]
		puts "Prime number from #{from} to #{to}"
		(from..to).map do |x|
			@flag=0
			next if x==1||x==2
			sqrt = Math.sqrt(x).ceil
			(2..sqrt).each do |div|
				@flag=1 if x%div==0
			end
			prime<< x if @flag==0
		end
		  prime
	end
end

obj=PrimeGenerator.new
puts obj.get_range