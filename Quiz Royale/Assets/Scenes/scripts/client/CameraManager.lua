--!Type(Client)
-- serialized variables --
--!Header("Zoom Settings")
--!SerializeField
local zoom : number = 15
--!SerializeField
local zoomMin : number = 10
--!SerializeField
local zoomMax : number = 50
--!SerializeField
local fov : number = 30
--!Header("Defaults")
--!SerializeField
local pitch : number = 30
--!SerializeField
local yaw : number = 45
--!SerializeField
local centerOnCharacterWhenSpawned : boolean = true
--!Header("Camera Points")
--!SerializeField
local lobbyCamera : GameObject = nil

-- camera check --
local camera = self.gameObject:GetComponent(Camera)
if camera == nil then
    print("HighriseCameraController requires a Camera component on the GameObject its attached to.")
    return
end
local cameraRig : Transform = camera.transform   -- quick reference to the camera's transform

-- local variables --
local inertiaVelocity : Vector3 = Vector3.zero;  -- the current velocity of the camera fom inertia
local inertiaMagnitude : number = 0;             -- the magnitude of the current InertiaVelocity (this is an optimization to avoid calculating it every frame)
local inertiaMultiplier : number = 2             -- A multiplier to the inertia force to make it feel more or less initially intense.
local closeMaxInitialInertia : number = 35       -- The maximum amount of force when applying inertia to the panning of the camera at closest zoom
local farMaxInitialIntertia : number = 150       -- The maximum amount of force when applying inertia to the panning of the camera at farthest zoom
local inertiaDampeningFactor : number = 0.93     -- The multiplier used to scale the inertia force back over time.

local initialZoomOfPinch : number = zoom         -- the zoom level at the start of the pinch gesture
local lastZoomScale : number = 1                 -- the scale that the pinch applied to InitialZoomOfPinch on the last frame, 1 being no change
local wasPinching : boolean = false                 -- whether the last frame was pinching (two fingers) or not

local rotation : Vector3 = Vector3.zero          -- the rotation of the camera (.y can be thought of it as the "swivel" of the camera around the Target)
local lastDirection : Vector2 = Vector2.zero     -- the direction of the last frame of the pinch gesture (for rotating the camera with touch controls)

local target = Vector3.zero                      -- the point the camera is looking at
local offset = Vector3.zero                      -- the offset from the Target

local cameraPoints = {}

-- functions --
function self.ClientAwake()
    -- setting camera points
    cameraPoints["lobby"] = lobbyCamera

    client.localPlayer.CharacterChanged:Connect(function()
        -- setting camera's position
        cameraRig.position = cameraPoints["lobby"].transform.position
        cameraRig.rotation = cameraPoints["lobby"].transform.rotation
    end)
end