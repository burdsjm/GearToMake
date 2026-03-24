-- init.lua
-- Checks the inventory for items listed in itemdb and reports their count

local itemdb = require("itemdb")

local function checkInventory(items)
    for _, item in ipairs(items) do
        local count = 0
        -- TODO: replace with actual inventory API calls
        print(item.name .. ": " .. count)
    end
end

checkInventory(itemdb)
