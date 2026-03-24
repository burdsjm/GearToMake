---itemdb.lua
--Item and currency database for GearToMake
--Organized by Expansion > Raid / Group / Currencies

local itemdb = {

    -----------------------
    -- TOB (Torment of Blood)
    -----------------------
    TOB = {
        -- Raid Items
        raid_items = {
            {"Armor of the Bound"},
            {"Armor Lining of Rebellion"}, {"Fastener of Rebellion"}, {"Core of Rebellion"},
            {"Polishing Cloth of Rebellion"}, {"Clasp of Rebellion"}, {"Enarmes of Rebellion"},
            {"Serving of Rebellion"}, {"Essence of Rebellion"}, {"Idol of Rebellion"}, {"Buckle of Rebellion"},
            {"Armor Lining of the Bound"}, {"Fastener of the Bound"}, {"Core of the Bound"},
            {"Polishing Cloth of the Bound"}, {"Clasp of the Bound"}, {"Enarmes of the Bound"},
            {"Serving of the Bound"}, {"Essence of the Bound"}, {"Idol of the Bound"},
        },
        -- Group Items
        group_items = {
            {"Armor of the Enthralled"},
            {"Armor of the Shackled"},
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
            {"Idol Polishing Cloth of Uprising"},
        },
        -- Currencies
        currencies = {
            {"Brood Officer's Emblem", 552, "TOB gear in HodStock!!"},
        },
    },

    -----------------------
    -- LS (Laurion's Song)
    -----------------------
    LS = {
        -- Raid Items
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
        -- Group Items
        group_items = {
            {"Gallant Wrist Armor Lining"}, {"Gallant Charm Polishing Cloth"}, {"Gallant Earring Clasp"},
            {"Gallant Essence of Finesse"}, {"Gallant Essence of Power"}, {"Gallant Amice Fastener"},
            {"Gallant Arm Armor Lining"}, {"Gallant Belt Buckle"}, {"Gallant Feet Armor Lining"},
            {"Gallant Hand Armor Lining"}, {"Gallant Head Armor Lining"}, {"Gallant Idol Polishing Cloth"},
            {"Gallant Necklace Clasp"}, {"Gallant Ring Polishing Cloth"}, {"Gallant Shield Enarmes"},
            {"Gallant String Serving"}, {"Gallant Leg Armor Lining"}, {"Gallant Mask Fastener"},
            {"Gallant Cloak Fastener"}, {"Gallant Chest Armor Lining"},
        },
        -- Currencies
        currencies = {
            {"Shalowains Private Reserve", 552, "LS gear in the Inn!!"},
        },
    },

    -----------------------
    -- NOS (Night of Shadows)
    -----------------------
    NOS = {
        -- Raid Items
        raid_items = {
            {"Faded Spectral Luminosity"},
            {"Apparitional"},
            {"Apparitional Essence"},
        },
        -- Group Items
        group_items = {
        },
        -- Currencies
        currencies = {
            {"Spiritual Medallion", 552, "NOS gear in Shar!!"},
        },
    },

    -----------------------
    -- TOL (Terror of Luclin)
    -----------------------
    TOL = {
        -- Raid Items
        raid_items = {
            {"Faded Waning Gibbous"},
            {"Calcified Bloodied Ore"},
        },
        -- Group Items
        group_items = {
        },
        -- Currencies
        currencies = {
            {"Medals of Conflict", 552, "TOL gear in ME!!"},
        },
    },

    -----------------------
    -- COV (Claws of Veeshan)
    -----------------------
    COV = {
        -- Raid Items
        raid_items = {
            {"Faded Hoarfrost"},
            {"Diamondized Restless Ore"},
        },
        -- Group Items
        group_items = {
        },
        -- Currencies
        currencies = {
            {"Warforged Emblem", 552, "COV gear in WW!!"},
        },
    },
}

return itemdb
