--!Type(Module)
-- required scripts --

-- serialized variables --
--!Header("Managers")
--!SerializeField
local uiManagerGo : GameObject = nil

--!Header("Spawners")
--!SerializeField
local travelSpawner : GameObject = nil
--!SerializeField
local kpopSpawner : GameObject = nil
--!SerializeField
local catCoffeSpawner : GameObject = nil

--!Header("Teleport Tap Handlers")
--!SerializeField
local travelTapH : TapHandler = nil
--!SerializeField
local kpopTapH : TapHandler = nil
--!SerializeField
local catCoffeTapH : TapHandler = nil

-- Select Portal 
--!Header("Activate Quizz Tap Handlers")
--!SerializeField
local travelQuizTapH : TapHandler = nil
--!SerializeField
local catCoffeQuizTapH : TapHandler = nil

-- global variables --
playersInGame = {}
spawnerPoints = {}
tapHandlers = {}
uiManager = nil

-- events --
changeRoomServer = Event.new("changeRoomServer")
changeRoomClient = Event.new("changeRoomClient")

-- local variables --

-- functions --
function self:ClientAwake()
    -- setting spawner points
    spawnerPoints["travel"] = travelSpawner
    spawnerPoints["kpop"] = kpopSpawner
    spawnerPoints["catCoffe"] = catCoffeSpawner

    -- setting tap handlers
    tapHandlers["travel"] = travelTapH
    tapHandlers["kpop"] = kpopTapH
    tapHandlers["catCoffe"] = catCoffeTapH

    -- tap handlers Quizz
    tapHandlers["travelQuiz"] = travelQuizTapH
    tapHandlers["catCoffeQuiz"] = travelQuizTapH

    -- setting other managers
    uiManager = uiManagerGo
end

function self:ServerAwake()
    changeRoomServer:Connect(function(player : Player, destination : string)
        changeRoomClient:FireAllClients(player, destination)
    end)
end

-- events --
scene.PlayerJoined:Connect(function(scene, player : Player)
    player.CharacterChanged:Connect(function()
        playersInGame[player.name] = player.character.gameObject
     end)
end)