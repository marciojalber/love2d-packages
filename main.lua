-- CARREGAMENTO INICIAL
function love.load()
   require "obj/Nave"
   require "config"
   player1 = Nave.new()
   player2 = Ovni.new()
   local f = love.graphics.newFont(12)
   love.graphics.setFont(f)
   -- love.graphics.setColor(0,0,0,255)
   -- love.graphics.setBackgroundColor(255,255,255)
   personX = 200
   personY = 50
end

-- CÁLCULOS
function love.update(dt)
   player1.move(dt)
   player1.applyGravity(dt)
   player2.move(dt)
   player2.applyGravity(dt)
end

-- DESENHO
function love.draw()
   player1.draw()
   player2.draw()
   if win.gridScale > 0 then
      drawGrid()
   end
end

function love.keypressed(key, unicode)
   if key == 'space' then
      player1.jump(dt)
      player2.jump(dt)
   end
end

function drawGrid()
   local x = win.gridScale
   local y = win.gridScale
   love.graphics.setColor(0.5, 0.5, 0.5)

   while x < win.w do
      love.graphics.line(x, 0, x, win.h)
      x = x + win.gridScale
   end

   while y < win.h do
      love.graphics.line(0, y, win.w, y)
      y = y + win.gridScale
   end
end