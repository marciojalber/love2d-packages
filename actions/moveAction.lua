--[[
PROPS
   underGravity   Sob gravidade
   velocity       Velocidade
   x              Posição X na tela
   y              Posição Y na tela

CONDICOES - MOVER VERTCIAL
   underGravity   != true
]]--

local function moveAction(this, keys)
   if this.underGravity == nil then
      error("Valor inexistente para [this.underGravity]")
   end

   if this.velocity == nil then
      error("Valor inexistente para [this.velocity]")
   end

   if this.x == nil then
      error("Valor inexistente para [this.x]")
   end

   if this.y == nil then
      error("Valor inexistente para [this.y]")
   end

   return function(dt)
      -- Define as variáveis
      local up       = 0
      local down     = 0
      local left     = 0
      local right    = 0
      local velocity = this.velocity * dt
      local limitY   = win.h - this.height
      local limitX   = win.w - this.width
      
      -- Captua a direção do movimento com as setas
      if not keys then
         if love.keyboard.isDown("up") then
            up = 1
         elseif love.keyboard.isDown("down") then
            down = 1
         end
         if love.keyboard.isDown("left") then
            left = 1
         elseif love.keyboard.isDown("right") then
            right = 1
         end
      
      -- Captua a direção do movimento com as teclas
      else
         if love.keyboard.isDown("w") then
            up = 1
         elseif love.keyboard.isDown("s") then
            down = 1
         end
         if love.keyboard.isDown("a") then
            left = 1
         elseif love.keyboard.isDown("d") then
            right = 1
         end
      end

      -- Indica se está se movendo na diagonal
      if (up + down > 0) and (left + right > 0) and not this.underGravity then
         velocity      = velocity * 0.8
      end

      -- Move o objeto na vertical
      if not this.underGravity then
         if up > 0 then
            local y = this.y - velocity
            if y < 0 then y = 0 end
            this.y = y
         elseif down > 0 then
            local y = this.y + velocity
            if y > limitY then y = limitY end
            this.y = y
         end
      end

      -- Move o objeto na horizontal
      if left > 0 then
         local x = this.x - velocity
         if x < 0 then x = 0 end
         this.x = x
      elseif right > 0 then
         local x = this.x + velocity
         if x > limitX then  x = limitX end
         this.x = x
      end
   end
end

return moveAction
