--[[

	hihi!, this script HASN'T been tested yet, but it should work.. hopefully xd - Gumicuci
	v1.0.2
]]

local request, getgenv = request, getgenv
local JSONEncode, POST, JSONDecode = function(data) return game:GetService("HttpService"):JSONEncode(data) end, function(url,data) request({Url=url,Body=data,Method="POST",Headers={["content-type"] = "application/json"}}) end, function(data) return game:GetService("HttpService"):JSONDecode(data) end
local headers = {["content-type"] = "application/json"}
local webhook = {}

webhook.GetRblxUserThumbnail = function(userid)
	local function GetImageUrl()
		local response = request({
			Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=".. userid.."&format=Png&size=150x150", 
			Method = "GET", 
			Headers = headers
		})
		
		local data = JSONDecode(response.Body)
		local imageurl = data.data[1].imageUrl
		return imageurl
	end
	
	return GetImageUrl()
end

webhook.IsWebhook = function(webhookurl)
	local responce = request({
		Url=webhookurl,
		Method="GET", 
		Headers={["content-type"] = "application/json"}
	})
	return true
end

webhook.DeleteWebhook = function(webhookurl)
	local responce = request({
		Url=webhookurl,
		Method="DELETE", 
		Headers={["content-type"] = "application/json"}
	})
	return responce
end

webhook.SendWebhook = function(webhookurl, data)
	if webhook.IsWebhook(webhookurl) then
		POST(webhookurl, JSONEncode(data))
	end
end

getgenv().webhook = webhook
