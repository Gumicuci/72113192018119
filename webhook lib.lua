--[[

	hihi!, this script HASN'T been tested yet, but it should work.. hopefully xd - Gumicuci

]]

local request, getgenv = request, getgenv
local JSONEncode, POST, JSONDecode = function(data) return game:GetService("HttpService"):JSONEncode(data) end, function(url,data) request({Url=url,Body=data,Method="POST",Headers={["content-type"] = "application/json"}}) end, function(data) return game:GetService("HttpService"):JSONDecode(data) end
local headers = {["content-type"] = "application/json"}
local webhook = {}

webhook.GetRblxUserThumbnail = function(userid)
	local function getImageUrl()
		local response = request({
			Url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=".. userid.."&format=Png&size=150x150", 
			Method = "GET", 
			Headers = headers
		})
		
		local data = JSONDecode(response.Body)
		local imageUrl = data.data[1].imageUrl
		return imageUrl
	end
end

webhook.IsWebhook = function(webhookurl)
	local responce = request({
		Url=webhookurl,
		Method="GET", 
		Headers={["content-type"] = "application/json"}
	})
	return responce.status
end

webhook.DeleteWebhook = function(webhookurl)
	local responce = request({
		Url=webhookurl,
		Method="DELETE", 
		Headers={["content-type"] = "application/json"}
	})
	return responce.status
end

webhook.SendWebhook = function(webhookurl, data)
	if webhook.iswebhook() then
		POST(webhookurl, JSONEncode(data))
	end
end

getgenv().webhook = webhook
