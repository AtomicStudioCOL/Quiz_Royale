--!Type(Client)

-- serialized sounds --
--!SerializeField
local _correctSound : AudioClip = nil
--!SerializeField
local _incorrectSound : AudioClip = nil
--!SerializeField
local _lostLife : AudioClip = nil

correctSound = nil
incorrectSound = nil
lostLife = nil

local audioSource : AudioSource = nil

--Functions
function playSound(clip, volume : number)
    if  audioSource == nil then 
        audioSource = self.gameObject:AddComponent(AudioSource)
        audioSource.loop = false
        audioSource.volume = volume
        audioSource:PlayOneShot(clip)
    else
        audioSource:PlayOneShot(clip)
        audioSource.loop = false
        audioSource.volume = volume
    end
end

--Unity Functions
function self:Start()
    correctSound = _correctSound
    incorrectSound = _incorrectSound
    lostLife = _lostLife
end