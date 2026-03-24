---GearToMake.lua
--by burdsjm
--Date 3/18/2024
--Modified by AI Assistant 5/28/2025 (Version 4.7)
local mq = require 'mq'
local version = '4.7' -- Updated version
local args = {...}  -- Get command line arguments
local default_message_format = '/dgt I have %s %s to make.'
local function check_and_report_item(item_name, message_format)
    local count = mq.TLO.FindItemCount(item_name)()
    if count == 0 then
        return
    end
    local final_message_format = message_format or default_message_format
    if message_format then
        if string.match(final_message_format, "%%s.%%s") then -- Matches two %s placeholders
            mq.cmdf(final_message_format, item_name, count)
        else -- Assumes custom format with one %s is for count
            mq.cmdf(final_message_format, count)
        end
    else
        mq.cmdf(default_message_format, item_name, count)
    end
end
local function welcome()
    printf('=-=-=-=-=-=-=-=-=-=\n\ay Welcome to GearToMake\ax\nVer \ag' .. version .. '\ax by burdsjm\ax\n\agStarting Script\ax\n=-=-=-=-=-=-=-=-=-=')
    print('/lua run geartomake - checks all items & currencies for all expansions')
    print('/lua run geartomake [exp] - checks all items & currencies for [exp]')
    print('  (e.g., /lua run geartomake TOB)')
    print('/lua run geartomake [exp] raid - checks only raid items for [exp]')
    print('  (e.g., /lua run geartomake TOB raid)')
    print('/lua run geartomake [exp] group - checks only group items for [exp]')
    print('  (e.g., /lua run geartomake TOB group)')
    print('Valid expansions: TOB, LS, NOS, TOL, COV')
end
-- Define items and currencies for each type
local items_currency_map = {
    TOB = {
        raid_items = {
            {"Armor of the Bound"}, -- Actual Raid Armor Set Name
            {"Armor Lining of Rebellion"}, {"Fastener of Rebellion"}, {"Core of Rebellion"},
            {"Polishing Cloth of Rebellion"}, {"Clasp of Rebellion"}, {"Enarmes of Rebellion"},
            {"Serving of Rebellion"}, {"Essence of Rebellion"}, {"Idol of Rebellion"}, {"Buckle of Rebellion"},
            {"Armor Lining of the Bound"}, {"Fastener of the Bound"}, {"Core of the Bound"},
            {"Polishing Cloth of the Bound"}, {"Clasp of the Bound"}, {"Enarmes of the Bound"},
            {"Serving of the Bound"}, {"Essence of the Bound"}, {"Idol of the Bound"},
        },
        group_items = {
            {"Armor of the Enthralled"}, -- Actual Group Armor Set Name
            {"Armor of the Shackled"}, -- Actual Group Armor Set Name
            {"Armor Lining of the Enthralled"}, {"Fastener of the Enthralled"}, {"Core of the Enthralled"},
            {"Polishing Cloth of the Enthralled"}, {"Clasp of the Enthralled"}, {"Enarmes of the Enthralled"},
            {"Serving of the Enthralled"}, {"Essence of the Enthralled"}, {"Idol of the Enthralled"},
            {"Armor Lining of the Shackled"}, {"Fastener of the Shackled"}, {"Core of the Shackled"},
            {"Polishing Cloth of the Shackled"}, {"Clasp of the Shackled"}, {"Enarmes of the Shackled"},
            {"Serving of the Shackled"}, {"Essence of the Shackled"}, {"Idol of the Shackled"},
            {"Cloak Fastener of Uprising"},
            {"Shoulder Fastener of Uprising"},
            {"Necklace Clasp of Uprising"},
            {"Earring Clasp of Uprising"},
            {"Ring Polishing Cloth of Uprising"},
            {"Belt Buckle of Uprising"},
            {"Charm Polishing Cloth of Uprising"},
            {"Shield Enarmes of Uprising"},
            {"Finesse Core of Uprising"},
            {"Power Core of Uprising"},
            {"String Serving of Uprising"},
            {"Chest Armor Lining of Uprising"},
            {"Leg Armor Lining of Uprising"},
            {"Arm Armor Lining of Uprising"},
            {"Head Armor Lining of Uprising"},
            {"Feet Armor Lining of Uprising"},
            {"Hand Armor Lining of Uprising"},
            {"Mask Fastener of Uprising"},
            {"Wrist Armor Lining of Uprising"},
            {"Idol Polishing Cloth of Uprising"}, -- Added this item
        },
        currencies = {
            {"Brood Officer's Emblem", 552, "TOB gear in HodStock!!"},
        },
    },
    LS = {
        raid_items = {
            {"Obscured Heroic Reflections"},
            {"Valiant Wrist Armor Lining"}, {"Valiant Charm Polishing Cloth"}, {"Valiant Earring Clasp"},
            {"Valiant Essence of Finesse"}, {"Valiant Essence of Power"}, {"Valiant Amice Fastener"},
            {"Valiant Arm Armor Lining"}, {"Valiant Belt Buckle"}, {"Valiant Feet Armor Lining"},
            {"Valiant Hand Armor Lining"}, {"Valiant Head Armor Lining"}, {"Valiant Idol Polishing Cloth"},
            {"Valiant Necklace Clasp"}, {"Valiant Ring Polishing Cloth"}, {"Valiant Shield Enarmes"},
            {"Valiant String Serving"}, {"Valiant Leg Armor Lining"}, {"Valiant Mask Fastener"},
            {"Valiant Cloak Fastener"}, {"Valiant Chest Armor Lining"},
        },
        group_items = {
            {"Gallant Wrist Armor Lining"}, {"Gallant Charm Polishing Cloth"}, {"Gallant Earring Clasp"},
            {"Gallant Essence of Finesse"}, {"Gallant Essence of Power"}, {"Gallant Amice Fastener"},
            {"Gallant Arm Armor Lining"}, {"Gallant Belt Buckle"}, {"Gallant Feet Armor Lining"},
            {"Gallant Hand Armor Lining"}, {"Gallant Head Armor Lining"}, {"Gallant Idol Polishing Cloth"},
            {"Gallant Necklace Clasp"}, {"Gallant Ring Polishing Cloth"}, {"Gallant Shield Enarmes"},
            {"Gallant String Serving"}, {"Gallant Leg Armor Lining"}, {"Gallant Mask Fastener"},
            {"Gallant Cloak Fastener"}, {"Gallant Chest Armor Lining"},
        },
        currencies = {
            {"Shalowains Private Reserve", 552, "LS gear in the Inn!!"},
        },
    },
    NOS = {
        raid_items = {
            {"Faded Spectral Luminosity"},
            {"Apparitional"},
            {"Apparitional Essence"},
        },
        group_items = {
            -- Placeholder for NOS group items, add specific item names when known
        },
        currencies = {
            {"Spiritual Medallion", 552, "NOS gear in Shar!!"},
        },
    },
    TOL = {
        raid_items = {
            {"Faded Waning Gibbous"},
            {"Calcified Bloodied Ore"},
        },
        group_items = {
            -- Placeholder for TOL group items, add specific item names when known
        },
        currencies = {
            {"Medals of Conflict", 552, "TOL gear in ME!!"},
        },
    },
    COV = {
        raid_items = {
            {"Faded Hoarfrost"},
            {"Diamondized Restless Ore"},
        },
        group_items = {
            -- Placeholder for COV group items, add specific item names when known
        },
        currencies = {
            {"Warforged Emblem", 552, "COV gear in WW!!"},
        },
    },
}
local function process_expansion(arg_key, filter_type)
    local expansion_data = items_currency_map[arg_key]
    if not expansion_data then
        printf("\arData for expansion %s not found.", arg_key)
        return
    end
    if filter_type == "raid" or not filter_type then
        if expansion_data.raid_items and #expansion_data.raid_items > 0 then
            if not filter_type or filter_type == "raid" then
                printf('--- Checking RAID items for %s ---', arg_key)
            end
            for _, item_config in ipairs(expansion_data.raid_items) do
                check_and_report_item(item_config[1], item_config[2])
            end
        elseif filter_type == "raid" then
             printf('--- No RAID items listed for %s ---', arg_key)
        end
    end
    if filter_type == "group" or not filter_type then
        if expansion_data.group_items and #expansion_data.group_items > 0 then
            if not filter_type or filter_type == "group" then
                 printf('--- Checking GROUP items for %s ---', arg_key)
            end
            for _, item_config in ipairs(expansion_data.group_items) do
                check_and_report_item(item_config[1], item_config[2])
            end
        elseif filter_type == "group" then
            printf('--- No GROUP items listed for %s ---', arg_key)
        end
    end
    if not filter_type then
        if expansion_data.currencies and #expansion_data.currencies > 0 then
            printf('--- Checking CURRENCIES for %s ---', arg_key)
            for _, currency_check in ipairs(expansion_data.currencies) do
                local currency_name = currency_check[1]
                local currency_value_per_item = currency_check[2]
                local currency_message = currency_check[3]
                local player_currency_total = mq.TLO.Me.AltCurrency(currency_name)()
                if player_currency_total then
                    if player_currency_total > 0 and currency_value_per_item > 0 then
                        local num_items_can_buy = math.floor(player_currency_total / currency_value_per_item)
                        if num_items_can_buy > 0 then
                            mq.cmdf('/dgt You can buy %s, %s', num_items_can_buy, currency_message)
                        end
                    end
                else
                    print(string.format("Currency '%s' not found for %s by TLO.", currency_name, arg_key))
                end
            end
        end
    end
end
welcome()
local expansion_arg = args[1] and args[1]:upper()
local filter_arg = args[2] and args[2]:lower()
if (not expansion_arg) then
    for key, _ in pairs(items_currency_map) do
        printf('\nChecking all for expansion: \ag%s\ax', key)
        process_expansion(key, nil)
    end
elseif items_currency_map[expansion_arg] then
    if filter_arg == "raid" or filter_arg == "group" then
        printf('\nChecking \ay%s\ax items for expansion: \ag%s\ax', filter_arg:upper(), expansion_arg)
        process_expansion(expansion_arg, filter_arg)
    elseif not filter_arg then
        printf('\nChecking all for expansion: \ag%s\ax', expansion_arg)
        process_expansion(expansion_arg, nil)
    else
        printf("\arInvalid filter type: \ay%s\ax. Use 'raid' or 'group'.", filter_arg)
    end
else
    if expansion_arg and (expansion_arg:lower() == "raid" or expansion_arg:lower() == "group") and not args[2] then
        printf("\arInvalid usage. Specify expansion THEN filter. Example: /lua run geartomake TOB %s", expansion_arg:lower())
    else
        printf("\arInvalid expansion argument: \ay%s\ax", expansion_arg or "N/A")
    end
end
print('\nDone checking for gear to make.')
