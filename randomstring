setreadonly(string, false)

function string:random(length)
    local alphabet = {}
    local string = ""

    for i = 65, 90 do
        table.insert(alphabet, utf8.char(i))
    end

    for i = 97, 122 do
        table.insert(alphabet, utf8.char(i))
    end

    for i = 1, length do
        string = string..alphabet[math.random(1, #alphabet)]
    end

    return string
end

setreadonly(string, true)
