require "./actions/moveAction"
require "./actions/jumpAction"
require "./effects/fallEffect"

Nave = {}

function Nave.new()
   local this        = {}
   this.image        = love.graphics.newImage("assets/img/nave100.png")
   this.x            = ( win.w - this.image:getWidth() ) / 2
   this.y            = win.h - this.image:getHeight()
   this.vel          = 250
   
   this.jumpHeight   = 2
   this.velY         = 0
   this.underGravity = false
   this.onFloor      = true

   this.draw = function()
      love.graphics.draw(this.image, this.x, this.y)
   end

   this.applyGravity = function(dt)
      fallEffect.fall(this, dt, false)
   end

   this.move = function(dt)
      moveAction.move(this, dt, false)
   end

   this.jump = function(dt)
      jumpAction.jump(this, dt, false)
   end

   return this
end

Ovni = {}

function Ovni.new()
   local this        = {}
   this.image        = love.graphics.newImage("assets/img/ovni100.png")
   this.x            = ( win.w - this.image:getWidth() ) / 2
   this.y            = win.h - this.image:getHeight()
   this.vel          = 250

   this.jumpHeight   = 4
   this.velY         = 0
   this.underGravity = false
   this.onFloor      = true

   function this.draw()
      love.graphics.draw(this.image, this.x, this.y)
   end

   this.applyGravity = function(dt)
      fallEffect.fall(this, dt, true)
   end

   this.move = function(dt)
      moveAction.move(this, dt, true)
   end

   this.jump = function(dt)
      jumpAction.jump(this, dt, true)
   end

   return this
end
