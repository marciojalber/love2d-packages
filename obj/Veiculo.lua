local moveAction = require "./actions/moveAction"
local jumpAction = require "./actions/jumpAction"
local fallEffect = require "./effects/fallEffect"

local Veiculo = {}

function Veiculo:new(attrs)
   local this        = {}
   this.image        = love.graphics.newImage("assets/img/" .. attrs.img)
   this.x            = ( win.w - this.image:getWidth() ) / 2
   this.y            = win.h - this.image:getHeight()
   this.width        = this.image:getWidth()
   this.height       = this.image:getHeight()
   this.velocity     = 250
   this.jumpHeight   = 2
   this.velocityY    = 0
   this.underGravity = false
   this.onFloor      = true
   this.useKeys      = false
   
   if attrs then
      if attrs.jumpHeight then
         this.jumpHeight   = attrs.jumpHeight
      end
      
      if attrs.velocityY then
         this.velocityY    = attrs.velocityY
      end
      
      if attrs.underGravity then
         this.underGravity = attrs.underGravity
      end
      
      if attrs.onFloor then
         this.onFloor      = attrs.onFloor
      end
      
      if attrs.useKeys then
         this.useKeys      = attrs.useKeys
      end
   end

   this.draw = function()
      love.graphics.draw(this.image, this.x, this.y)
   end

   this.applyGravity = fallEffect(this, this.useKeys)
   this.move         = moveAction(this, this.useKeys)
   this.jump         = jumpAction(this, this.useKeys)

   return this
end

return Veiculo
