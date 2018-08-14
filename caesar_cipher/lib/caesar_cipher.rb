module CaesarCipher
	def shift_letters(alphaVal, key)
		shift_vals = []
		for i in alphaVal
			if (i > 65 && i <= 90) || (i > 96 && i <= 122)
				if i > (90 - key) && i <= 90
					shift_vals << (64 + (key - (90 - i)))
				elsif i > (122 - key) && i <= 122
					shift_vals << (96 + (key - (122 - i)))
				else
					shift_vals << i + key
				end
			else
				shift_vals << i
			end
		end
		return shift_vals
	end

	def crypt_message(alphaNew)
		cryptText = ''
		for i in alphaNew
			cryptText << i.chr
		end
		return cryptText
	end

	def caesar_cipher(text = '', key = 0)
		if key > 26
			key = key % 26
		end
		letters = text.split('')
		char_values = []
		letters.each do |i|
			char_values << i.ord
		end
		char_values = shift_letters(char_values, key)
		ciphered_text = crypt_message(char_values)
		return ciphered_text
	end
end