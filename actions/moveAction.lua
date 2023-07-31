moveAction = {}

moveAction.move = function(this, dt, keys)
   -- Define as variáveis
   local up       = 0
   local down     = 0
   local left     = 0
   local right    = 0
   local vel      = this.vel * dt
   local limitY   = win.h - this.image:getHeight()
   local limitX   = win.w - this.image:getWidth()
   
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
   if (up + down > 0) and (left + right > 0) then
      vel      = vel * 0.8
   end

   -- Move o objeto na vertical
   if up > 0 then
      local y = this.y - vel
      if y < 0 then y = 0 end
      this.y = y
   elseif down > 0 then
      local y = this.y + vel
      if y > limitY then y = limitY end
      this.y = y
   end

   -- Move o objeto na horizontal
   if left > 0 then
      local x = this.x - vel
      if x < 0 then x = 0 end
      this.x = x
   elseif right > 0 then
      local x = this.x + vel
      if x > limitX then  x = limitX end
      this.x = x
   end
end
