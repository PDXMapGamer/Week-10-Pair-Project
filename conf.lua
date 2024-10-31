local love = require("love")

function love.conf(t)
t.window.title = "Hakurei's Space Adventure"    
t.window.width = 1024
t.window.height = 768
--! console can be useful for debugging
t.console = true 
-- t.identity = nil --> Allows us to make a save file, possible stretch goal.
end