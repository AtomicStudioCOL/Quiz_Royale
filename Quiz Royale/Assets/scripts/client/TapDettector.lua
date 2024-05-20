--!Type(Client)

-- functions --
function self:OnCollisionEnter(collision : Collision)
    print(collision.gameObject)
end