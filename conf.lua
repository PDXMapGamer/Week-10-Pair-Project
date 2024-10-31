local love = require("love")

function love.conf(t)
t.window.title = "Hakurei's Adventure Through An Ambiguously Themed Game"    
t.window.width = 1024
t.window.height = 768
--! console can be useful for debugging
t.console = true 
-- t.identity = nil --> Allows us to make a save file, possible stretch goal.
end