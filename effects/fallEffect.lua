--[[
PROPS
   underGravity   Sob gravidade
   velocityY      Velocidade da queda
   height         Altura do objeto
   onFloor        Está no chão

CONDICOES
   underGravity   != true
   onFloor        != true
]]--

local function fallEffect(this, keys)
   if this.underGravity == nil then
      error("Valor inexistente para [this.underGravity]")
   end

   if this.velocityY == nil then
      error("Valor inexistente para [this.velocityY]")
   end

   if this.height == nil then
      error("Valor inexistente para [this.height]")
   end

   if this.onFloor == nil then
      error("Valor inexistente para [this.onFloor]")
   end

   return function(dt)
      -- Não cai se não estiver sob gravidade
      if not this.underGravity then
         return
      end

      -- Não cai se estiver no chão
      if this.onFloor then
         return
      end

      -- Define as variáveis
      this.velocityY = this.velocityY + gravity * dt / 2
      local limitY   = win.h - this.height
      local y        = this.y + this.velocityY

      if y >= limitY then
         y              = limitY
         this.onFloor   = true
      end
      
      this.y         = y
   end
end

return fallEffect
