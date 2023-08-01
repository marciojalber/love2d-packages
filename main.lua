-- CARREGAMENTO INICIAL
function love.load()
   require "config"
   local Veiculo = require "obj/Veiculo"

   players = {
      player1 = Veiculo:new({img = 'nave100.png'}),
      player2 = Veiculo:new({img = 'ovni100.png', useKeys = true, underGravity = true, jumpHeight = 4}),
   }

   local f = love.graphics.newFont(12)
   love.graphics.setFont(f)
   -- love.graphics.setColor(0,0,0,255)
   -- love.graphics.setBackgroundColor(255,255,255)
   personX = 200
   personY = 50
end

-- CÁLCULOS
function love.update(dt)
   for i,v in pairs(players) do
      players[i].move(dt)
      players[i].applyGravity(dt)
   end
end

-- DESENHO
function love.draw()
   for i,v in pairs(players) do
      players[i].draw()
   end
   if win.gridScale > 0 then
      drawGrid()
   end
end

function love.keypressed(key, unicode)
   if key == 'space' then
      for i,v in pairs(players) do
         players[i].jump(dt)
      end
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