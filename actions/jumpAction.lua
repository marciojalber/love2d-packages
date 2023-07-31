jumpAction = {}

jumpAction.jump = function(this, keys)
   return function(dt)
      if this.onFloor and not this.underGravity then
         this.velY      = -gravity / 10 * (1 - (1 - this.jumpHeight)/3)
         this.onFloor   = false
      end
   end
end
