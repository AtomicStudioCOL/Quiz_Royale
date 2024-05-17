--!Type(Module)
-- required scripts --

-- serialized variables --
--!Header("Spawners")
--!SerializeField
local lobbySpawner : GameObject = nil

-- global variables --
playersInGame = {}
spawnerPoints = {}

-- local variables --

-- functions --
function self.ClientAwake()
    -- setting spawner points
    spawnerPoints["lobby"] = lobbySpawner
end

-- events --
scene.PlayerJoined:Connect(function(scene, player : Player)
    player.CharacterChanged:Connect(function()
        playersInGame[player.name] = player.character.gameObject
     end)
end)