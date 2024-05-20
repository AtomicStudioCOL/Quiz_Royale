--!Type(UI)

-- Assignment of Label
--!Bind
local myLabel : UILabel = nil

-- Assignment of Label
--!Bind
local myQuestion : UILabel = nil

-- Instance of Button
local myButton = UIButton.new()

-- Control Variable
local buttonActive = false

function changeButtonState()
    if buttonActive == false then 
        myQuestion:SetPrelocalizedText("Button Active", true)
        buttonActive = true
    else
        myQuestion:SetPrelocalizedText("Button Deactive", true)
        buttonActive = false
    end 
end

-- Assignment Text Label
myLabel:SetPrelocalizedText("Button", true)

myQuestion:SetPrelocalizedText("Button Deactive", true)

-- Assignment and Create Button Funcionality
function ActiveButton()
    myButton:RegisterPressCallback(function()
        -- Loigc
        changeButtonState()
     end)
     myLabel:Add(myButton)
end

ActiveButton()

-- Script for server

-- functions --

-- event functions --
function self:ClientStart()
    --[[client.PlayerConnected:FireServer(function(player : Player)
        player.CharacterChanged:Connect(function()
            changeButtonState()       
        end)
    end)--]]
end
