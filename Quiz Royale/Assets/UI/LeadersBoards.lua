--!Type(UI)

-- for function Responsive
--!Bind
local _leadersBoardsUI : UIView = nil

--!Bind
local _firstLabel : UILabel = nil
--!Bind
local _firstNum : UILabel = nil
--!Bind
local _firstPlyr : UILabel = nil
--!Bind
local _firstScore : UILabel = nil

--!Bind
local _secondLabel : UILabel = nil
--!Bind
local _secondNum : UILabel = nil
--!Bind
local _secondPlyr : UILabel = nil
--!Bind
local _secondScore : UILabel = nil

--!Bind
local _thirdLabel : UILabel = nil
--!Bind
local _thirdNum : UILabel = nil
--!Bind
local _thirdPlyr : UILabel = nil
--!Bind
local _thirdScore : UILabel = nil

--!Bind
local _fourthLabel : UILabel = nil
--!Bind
local _fourthNum : UILabel = nil
--!Bind
local _fourthPlyr : UILabel = nil
--!Bind
local _fourthScore : UILabel = nil

--!Bind
local _fifthLabel : UILabel = nil
--!Bind
local _fifthNum : UILabel = nil
--!Bind
local _fifthPlyr : UILabel = nil
--!Bind
local _fifthScore : UILabel = nil

--!Bind
local _sixthLabel : UILabel = nil
--!Bind
local _sixthNum : UILabel = nil
--!Bind
local _sixthPlyr : UILabel = nil
--!Bind
local _sixthScore : UILabel = nil

--!Bind
local _seventhLabel : UILabel = nil
--!Bind
local _seventhNum : UILabel = nil
--!Bind
local _seventhPlyr : UILabel = nil
--!Bind
local _seventhScore : UILabel = nil

--!Bind
local _eighthLabel : UILabel = nil
--!Bind
local _eighthNum : UILabel = nil
--!Bind
local _eighthPlyr : UILabel = nil
--!Bind
local _eighthScore : UILabel = nil

-- Variables for manager of data
local _screenWidth

-- Function to initialize the client
function self:ClientAwake()
    --_screenWidth = Screen.width -- Get the screen width
    _leadersBoardsUI:AddToClassList("leadersBoards")
end

-- functions --
function disableLeadersBoardsUI()
    self.enabled = false
end

function clearLabelAndChildren(parentLabel, numberLable, playerNameLable, scoreLable)
    parentLabel:SetPrelocalizedText(" ")        parentLabel:ClearClassList()        parentLabel:AddToClassList("inactive")
    numberLable:SetPrelocalizedText(" ")        numberLable:ClearClassList()        numberLable:AddToClassList("inactive")
    playerNameLable:SetPrelocalizedText(" ")    playerNameLable:ClearClassList()    playerNameLable:AddToClassList("inactive")
    scoreLable:SetPrelocalizedText(" ")         scoreLable:ClearClassList()         scoreLable:AddToClassList("inactive")
end

function clearLeaderboards()
    --[[
    print(`first: {_firstLabel}, {_firstNum}, {_firstPlyr}, {_firstScore}`)
    print(`second: {_secondLabel}, {_secondNum}, {_secondPlyr}, {_secondScore}`)
    print(`third: {_thirdLabel}, {_thirdNum}, {_thirdPlyr}, {_thirdScore}`)
    print(`fourth: {_fourthLabel}, {_fourthNum}, {_fourthPlyr}, {_fourthScore}`)
    print(`fifth: {_fifthLabel}, {_fifthNum}, {_fifthPlyr}, {_fifthScore}`)
    print(`sixth: {_sixthLabel}, {_sixthNum}, {_sixthPlyr}, {_sixthScore}`)
    print(`seventh: {_seventhLabel}, {_seventhNum}, {_seventhPlyr}, {_seventhScore}`)
    print(`eighth: {_eighthLabel}, {_eighthNum}, {_eighthPlyr}, {_eighthScore}`)
    --]]
    clearLabelAndChildren(_firstLabel,   _firstNum,   _firstPlyr,   _firstScore)
    clearLabelAndChildren(_secondLabel,  _secondNum,  _secondPlyr,  _secondScore)
    clearLabelAndChildren(_thirdLabel,   _thirdNum,   _thirdPlyr,   _thirdScore)
    clearLabelAndChildren(_fourthLabel,  _fourthNum,  _fourthPlyr,  _fourthScore)
    clearLabelAndChildren(_fifthLabel,   _fifthNum,   _fifthPlyr,   _fifthScore)
    clearLabelAndChildren(_sixthLabel,   _sixthNum,   _sixthPlyr,   _sixthScore)
    clearLabelAndChildren(_seventhLabel, _seventhNum, _seventhPlyr, _seventhScore)
    clearLabelAndChildren(_eighthLabel,  _eighthNum,  _eighthPlyr,  _eighthScore)
end

function setLabels(numberLable, numberTxt, playerNameLable, playerNameTxt, scoreLable, scoreTxt)
    numberLable:SetPrelocalizedText(numberTxt)          numberLable:ClearClassList()        numberLable:AddToClassList("number")
    playerNameLable:SetPrelocalizedText(playerNameTxt)  playerNameLable:ClearClassList()    playerNameLable:AddToClassList("player")
    scoreLable:SetPrelocalizedText(scoreTxt)            scoreLable:ClearClassList()         scoreLable:AddToClassList("score")
    numberLable:AddToClassList("active")                scoreLable:AddToClassList("active") playerNameLable:AddToClassList("active")
end

function setLeaderboards(scoreTable)
    self.enabled = true;
    clearLeaderboards()

    for i, value in pairs(scoreTable) do
        if i == 1 then
            _firstLabel:AddToClassList("active")
            _firstLabel:AddToClassList("parent")
            setLabels(_firstNum, `{i}`, _firstPlyr, `{value[1]}`, _firstScore, `{value[2]}`)
        elseif i == 2 then
            _secondLabel:AddToClassList("active")
            _secondLabel:AddToClassList("parent")
            setLabels(_secondNum, `{i}`, _secondPlyr, `{value[1]}`, _secondScore, `{value[2]}`)
        elseif i == 3 then
            _thirdLabel:AddToClassList("active")
            _thirdLabel:AddToClassList("parent")
            setLabels(_thirdNum, `{i}`, _thirdPlyr, `{value[1]}`, _thirdScore, `{value[2]}`)
        elseif i == 4 then
            _fourthLabel:AddToClassList("active")
            _fourthLabel:AddToClassList("parent")
            setLabels(_fourthNum, `{i}`, _fourthPlyr, `{value[1]}`, _fourthScore, `{value[2]}`)
        elseif i == 5 then
            _fifthLabel:AddToClassList("active")
            _fifthLabel:AddToClassList("parent")
            setLabels(_fifthNum, `{i}`, _fifthPlyr, `{value[1]}`, _fifthScore, `{value[2]}`)
        elseif i== 6 then
            _sixthLabel:AddToClassList("active")
            _sixthLabel:AddToClassList("parent")
            setLabels(_sixthNum, `{i}`, _sixthPlyr, `{value[1]}`, _sixthScore, `{value[2]}`)
        elseif i == 7 then
            _seventhLabel:AddToClassList("active")
            _seventhLabel:AddToClassList("parent")
            setLabels(_seventhNum, `{i}`, _seventhPlyr, `{value[1]}`, _seventhScore, `{value[2]}`)
        elseif i == 8 then
            _eighthLabel:AddToClassList("active")
            _eighthLabel:AddToClassList("parent")
            setLabels(_eighthNum, `{i}`, _eighthPlyr, `{value[1]}`, _eighthScore, `{value[2]}`)
        end
    end
end

-- events
client.PlayerConnected:Connect(function()
    disableLeadersBoardsUI();
end)
