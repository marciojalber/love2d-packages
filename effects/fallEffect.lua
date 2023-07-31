fallEffect = {}

fallEffect.fall = function(this, dt, keys)
   -- Não cai se estiver no chão
   if this.onFloor then
      return
   end

   -- Define as variáveis
   this.velY      = this.velY + gravity * dt / 2
   local limitY   = win.h - this.image:getHeight()
   local y        = this.y + this.velY
   print(this)

   if y >= limitY then
      y              = limitY
      this.onFloor   = true
   end
   
   this.y         = y
end
