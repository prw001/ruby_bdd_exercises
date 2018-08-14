require "my_enumerable.rb"
Array include MyEnumerable
describe MyEnumerable do 
	test = [1, 2, 3, 4]
	describe ".my_select" do 
		context "when given a method" do 
			it "returns an array of items based on that method" do 
				expect(test.select{|x| x % 2 == 0}).to eql([2, 4])
			end
		end
	end

	describe ".my_all" do
		context "when all items match given criteria" do 
			it "returns true" do 
				expect(test.my_all{|x| x.is_a? Integer}).to eql(true)
			end
		end

		context "when most items match given criteria" do 
			it "returns false" do 
				expect(test.my_all{|x| x < 4}).to eql(false)
			end
		end

		context "when no items match given criteria" do 
			it "returns false" do 
				expect(test.my_all{|x| x.is_a? String}).to eql(false)
			end
		end
	end

	describe ".my_any" do 
		context "when any items match given criteria" do 
			it "returns true" do 
				expect(test.my_any{|x| x == 3}).to eql(true)
			end
		end

		context "when no items match a given criteria" do 
			it "returns false" do 
				expect(test.my_any{|x| x == "Joe"}).to eql(false)
			end
		end
	end

	describe ".my_none" do 
		context "when no items match given criteria" do 
			it "returns true" do 
				expect(test.my_none{|x| x > 4}).to eql(true)
			end
		end

		context "when one item matches given criteria" do 
			it "returns false" do 
				expect(test.my_none{|x| x < 2}).to eql(false)
			end
		end
	end

	describe ".my_count" do 
		context "when only a bloc is given" do 

			context "when zero items are a match for the given bloc" do 
				it "returns 0" do 
					expect(test.my_count{|x| x > 10}).to eql(0)
				end
			end

			context "when one item is a match for the given bloc" do 
				it "returns 1" do 
					expect(test.my_count{|x| x == 2}).to eql(1)
				end
			end

			context "when multiple items are a match for the given bloc" do 
				it "returns the number of matching items" do 
					expect(test.my_count{|x| x > 1}).to eql(3)
				end
			end
		end

		context "when only an argument is given" do 

			context "when zero items match the argument" do 
				it "returns 0" do 
					expect(test.my_count{|x| x == 10}).to eql(0)
				end
			end

			context "when one item matches the argument" do 
				it "returns 1" do 
					expect(test.my_count{|x| x == 3}).to eql(1)
				end
			end

			context "when multiple items are a match for the argument" do 
				it "returns the number of matching items" do 
					expect(test.my_count{|x| x < 5}).to eql(4)
				end
			end
		end

		context "when an argument and bloc are given" do 

			context "when zero items match the evaluation of the bloc" do 
				it "returns 0" do 
					expect(test.my_count(1){|x| x * 2}).to eql(0)
				end
			end

			context "when one item matches the evaluation of the bloc" do 
				it "returns 1" do 
					expect(test.my_count(1){|x| x % 5}).to eql(1)
				end
			end

			context "when multiple items match the evaluation of the bloc" do 
				it "returns the number of matches" do 
					expect(test.my_count(0){|x| x / 10}).to eql(4)
				end
			end
		end
	end

	describe ".my_map" do 
		context "when given a bloc" do 
			it "creates an array of the evaluations of the bloc on each element" do 
				expect(test.my_map{|x| x * 2}).to eql([2, 4, 6, 8])
			end
		end

		context "when not given a bloc" do 
			it "returns an empty array" do 
				expect(test.my_map).to eql([])
			end
		end
	end

	func = Proc.new{|x| x * 10}

	describe ".my_map_mod" do 
		context "when given a proc and not a bloc" do 
			it "returns an array of elements based on the proc function" do 
				expect(test.my_map_mod(func)).to eql([10, 20, 30, 40])
			end
		end

		context "when given a proc and a bloc" do 
			it "it evaluates the proc and then the bloc on each element and returns an array of the results" do 
				expect(test.my_map_mod(func){|x| x * 2}).to eql([20, 40, 60, 80])
			end
		end

		context "when given a bloc and not a proc" do 
			it "returns an array of elements based on the bloc function" do 
				expect(test.my_map_mod{|x| x * 4}).to eql([4, 8, 12, 16])
			end
		end
	end
end


