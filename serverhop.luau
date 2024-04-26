local HttpService = game:GetService("HttpService")

local URL = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/0?excludeFullGames=true&cursor="
local Response = request({Url = URL, Method = "GET"})
local Decoded = HttpService:JSONDecode(Response.Body)

local Cursor = Decoded.nextPageCursor
local Data = Decoded.data

while true do task.wait()
    for Index, Value in Data do
        if Value.id == game.JobId then
            continue
        end

        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Value.id, game:GetService("Players").LocalPlayer)
    end

    if not Cursor then
        break
    end

    URL = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/0?excludeFullGames=true&cursor="..Cursor
    Response = request({Url = URL, Method = "GET"})
    Decoded = HttpService:JSONDecode(Response.Body)

    Cursor = Decoded.nextPageCursor
    Data = Decoded.data
end
