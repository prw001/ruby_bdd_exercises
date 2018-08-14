require 'caesar_cipher.rb' 

describe CaesarCipher do
	let (:dummy_class) { Class.new {extend CaesarCipher} }

	describe".caesar_cipher" do 
		context "given an empty string" do 
					it "returns an empty string" do 
				expect(dummy_class.caesar_cipher('', 25)).to eql('')
			end
		end

		context "given a single letter" do 
			it "returns a ciphered letter" do 
				expect(dummy_class.caesar_cipher('a', 1)).to eql('b')
			end
		end

		context "given a word" do 
			it "returns a ciphered word" do 
				expect(dummy_class.caesar_cipher('hello', 2)).to eql('jgnnq')
			end
		end

		context "given a word with capitalized letters" do 
			it "ciphers the word and retains capitalization" do 
				expect(dummy_class.caesar_cipher('Hello', 2)).to eql('Jgnnq')
			end
		end

		context "given multiple words" do 
			it "ciphers multiple words and not spaces" do 
				expect(dummy_class.caesar_cipher('Hello world', 2)).to eql('Jgnnq yqtnf')
			end
		end

		context "given punctuation" do 
			it "ciphers letters and not punctuation" do 
				expect(dummy_class.caesar_cipher("I've said, 'Hello, world!'", 2)).to eql("K'xg uckf, 'Jgnnq, yqtnf!'")
			end
		end
	end
end