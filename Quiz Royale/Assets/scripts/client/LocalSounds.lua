--!Type(Client)

-- serialized sounds --
--!SerializeField
local _correctSound : AudioClip = nil
--!SerializeField
local _incorrectSound : AudioClip = nil

correctSound = nil
incorrectSound = nil

local audioSource : AudioSource = nil

--Functions
function playSound(clip)
    if  audioSource == nil then 
        audioSource = self.gameObject:AddComponent(AudioSource)
        audioSource.loop = false
        audioSource.volume = .5
        audioSource:PlayOneShot(clip)
    else
        audioSource:PlayOneShot(clip)
        audioSource.loop = false
        audioSource.volume = .5
    end
end

--Unity Functions
function self:Start()
    correctSound = _correctSound
    incorrectSound = _incorrectSound
end