math.randomseed(os.time())

symbols = {
    "a", "b", "s", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "k", "r", "!", "@", "#", "$", "%", "^", "&", "*", "_", "A", "S", "D", "G", "H", "J", "K",
    1, 2, 3, 4, 5, 6, 7, 8, 9
}

function generatePassword(minLength)
     password = {}
    while #password < minLength do
        randomIndex = math.random(1, #symbols)
        table.insert(password, symbols[randomIndex])
    end
    return password
end

function containsUppercase(password)
    for _, char in ipairs(password) do
        if type(char) == "string" and char:match("%u") then
            return true
        end
    end
    return false
end

function containsSymbol(password)
    for _, char in ipairs(password) do
        if type(char) == "string" and char:match("[%p]") then
            return true
        end
    end
    return false
end

function containsNumber(password)
    for _, char in ipairs(password) do
        if type(char) == "number" then
            return true
        end
    end
    return false
end

function isPasswordValid(password)
    return #password >= 8 and containsUppercase(password) and containsSymbol(password) and containsNumber(password)
end

repeat
    print("Enter minimum password length:")
    minLength = tonumber(io.read())
    
    password = generatePassword(minLength)
    
    if isPasswordValid(password) then
        print("Random password: " .. table.concat(password))
        break
    else
        print("password is: " .. table.concat(password))
        print("Password is too short or does not meet requirements.")
        print("Generate again? (yes / no)")
        local answer = io.read()
        if answer:lower() ~= "yes" then
            break
        end
    end
until false