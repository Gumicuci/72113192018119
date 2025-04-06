local array = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", ";", ":", "'", ",", ".", "<", ">", "/", "?", "|", "`", "~", "£", "€", " "}
local array2 = {"$", "1", "y", "x", "6", "a", "l", "4", "U", "u", "J", "p", "&", "=", "f", "m", "I", "|", "X", "5", "(", "F", "_", "s", "/", "9", "<", "P", ")", "v", "E", ";", "-", "W", "S", "r", "0", "c", "e", "C", "3", "Z", "/", "[", "G", "8", "T", "b", "^", "j", "i", "{", "L", "o", "V", "€", ".", "Y", "z", "+", "h", "t", "q", "R", "d", "}", "D", ",", "%", "#", "k", "B", "n", "Q", "£", "*", "M", "H", "g", "O", "w", "`", "@", "2", "A", ">", "'", "!", "K", "7", ":", "N", "?", "~", "]"}

getgenv().encode = function(input : string)
	if input == "" then
		return "Encode Input is Empty, Arg1."
	else
		local result = ""

		for i = 1, #input do
			local char = input:sub(i, i)
			for index, value in ipairs(array) do
				if char == value then
					if array2[index] then
						result = result .. tostring(array2[index])
					end
					break
				end
			end
		end
		
		return result
	end
end

getgenv().decode = function(input : string)
	if input == "" then
		return "Decode Input is Empty, Arg1."
	else
		local result = ""

		for i = 1, #input do
			local char = input:sub(i, i)
			for index, value in ipairs(array2) do
				if char == value then
					if array[index] then
						result = result .. tostring(array[index])
					end
					break
				end
			end
		end
		
		return result
	end
end
