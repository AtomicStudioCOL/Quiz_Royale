--!Type(UI)

-- for function Responsive
--!Bind
local _leadersBoardsUI : UIView = nil

--!Bind
local _firstLabel : UILabel = nil
--!Bind
local _secondLabel : UILabel = nil
--!Bind
local _thirdLabel : UILabel = nil
--!Bind
local _fourthLabel : UILabel = nil
--!Bind
local _fifthLabel : UILabel = nil
--!Bind
local _sixthLabel : UILabel = nil
--!Bind
local _seventhLabel : UILabel = nil
--!Bind
local _eighthLabel : UILabel = nil

-- Variables for manager of data
local _screenWidth

_firstLabel:SetPrelocalizedText(" ", false)
_secondLabel:SetPrelocalizedText(" ", false)
_thirdLabel:SetPrelocalizedText(" ", false)
_fourthLabel:SetPrelocalizedText(" ", false)
_fifthLabel:SetPrelocalizedText(" ", false)
_sixthLabel:SetPrelocalizedText(" ", false)
_seventhLabel:SetPrelocalizedText(" ", false)
_eighthLabel:SetPrelocalizedText(" ", false)


-- Function to initialize the client
function self:ClientAwake()
  _screenWidth = Screen.width -- Get the screen width
  print("Screen width: " .. tostring(_screenWidth)) -- Print the screen width
  
  if _screenWidth > 840 then
    _leadersBoardsUI:AddToClassList("leaders-boardsUI-Horizontal")
elseif _screenWidth < 840 then
    _leadersBoardsUI:AddToClassList("leaders-boardsUI-Vertical")
  end
end

-- functions --
function disableLeadersBoardsUI()
    self.enabled = false
end

function setLeaderboards(scoreTable)
    self.enabled = true;

    for i, value in pairs(scoreTable) do
        if i == 1 then
            _firstLabel:AddToClassList("active")            
            _firstLabel:SetPrelocalizedText(value, false)
        elseif i == 2 then
            _secondLabel:AddToClassList("active")
            _secondLabel:SetPrelocalizedText(value, false)
        elseif i == 3 then
            _thirdLabel:AddToClassList("active")
            _thirdLabel:SetPrelocalizedText(value, false)
        elseif i == 4 then
            _fourthLabel:AddToClassList("active")
            _fourthLabel:SetPrelocalizedText(value, false)
        elseif i == 5 then
            _fifthLabel:AddToClassList("active")
            _fifthLabel:SetPrelocalizedText(value, false)
        elseif i== 6 then
            _sixthLabel:AddToClassList("active")
            _sixthLabel:SetPrelocalizedText(value, false)
        elseif i == 7 then
            _seventhLabel:AddToClassList("active")
            _seventhLabel:SetPrelocalizedText(value, false)
        elseif i == 8 then
            _eighthLabel:AddToClassList("active")
            _eighthLabel:SetPrelocalizedText(value, false)
        end
    end
end

-- events
client.PlayerConnected:Connect(function()
    disableLeadersBoardsUI();
end)
