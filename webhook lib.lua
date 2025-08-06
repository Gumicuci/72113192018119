--[[

	hihi!, this script HASN'T been tested yet, but it should work.. hopefully xd - Gumicuci

]]

local request, getgenv = request, getgenv
local JSONEncode, POST = function(data) return game:GetService("HttpService"):JSONEncode(data) end, function(url,data) request({Url=url,Body=data,Method="POST",Headers={["content-type"] = "application/json"}}) end
local webhook = {}

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
