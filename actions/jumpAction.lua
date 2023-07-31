jumpAction = {}

jumpAction.jump = function(this, dt, keys)
   if this.onFloor then
      print(this.jumpHeight, -gravity / 10, -gravity / 10 * this.jumpHeight)
      this.velY      = -gravity / 10 * (1 - (1 - this.jumpHeight)/3)
      this.onFloor   = false
   end
end
