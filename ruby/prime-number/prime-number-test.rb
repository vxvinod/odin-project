require 'test/unit'
require '.\prime-number.rb'

class PrimeNumberTest < Test::Unit::TestCase
    def test_prime
        obj=PrimeGenerator.new
        @actual=obj.get_range
        puts @actual
        @expected_result=[3,5,7,11,13]
        assert_equal(@expected_result,@actual,message="test")     
    end 
end

ob=PrimeNumberTest.new
ob.test_prime