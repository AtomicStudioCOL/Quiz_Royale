--!Type(UI)

--!Bind
local myButton : UIButton = nil
--!Bind
local myLabel : UILabel = nil

myLabel:SetPrelocalizedText("I am a UILabel", true)
myButton:Add(myLabel)
myLabel:BringToFront()