require "./actions/moveAction"
require "./actions/jumpAction"
require "./effects/fallEffect"

Nave = {}

function Nave.new()
   local this        = {}
   this.image        = love.graphics.newImage("assets/img/nave100.png")
   this.x            = ( win.w - this.image:getWidth() ) / 2
   this.y            = win.h - this.image:getHeight()
   this.width        = this.image:getWidth()
   this.height       = this.image:getHeight()
   this.velocity     = 250
   
   this.jumpHeight   = 2
   this.velocityY    = 0
   this.underGravity = false
   this.onFloor      = true

   this.draw = function()
      love.graphics.draw(this.image, this.x, this.y)
   end

   this.applyGravity = fallEffect.fall(this, false)
   this.move         = moveAction.move(this, false)
   this.jump         = jumpAction.jump(this, false)

   return this
end

Ovni = {}

function Ovni.new()
   local this        = {}
   this.image        = love.graphics.newImage("assets/img/ovni100.png")
   this.x            = ( win.w - this.image:getWidth() ) / 2
   this.y            = win.h - this.image:getHeight()
   this.width        = this.image:getWidth()
   this.height       = this.image:getHeight()
   this.velocity     = 250

   this.jumpHeight   = 4
   this.velocityY    = 0
   this.underGravity = true
   this.onFloor      = true

   function this.draw()
      love.graphics.draw(this.image, this.x, this.y)
   end
   
   this.applyGravity = fallEffect.fall(this, true)
   this.move         = moveAction.move(this, true)
   this.jump         = jumpAction.jump(this, true)

   return this
end
