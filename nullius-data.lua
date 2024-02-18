if mods["nullius"] then
    --ignore if this technology disabled
    if settings.startup["PDA-setting-tech-required"].value then
        data.raw.technology["Arci-pavement-drive-assistant"].prerequisites = {"nullius-personal-transportation-1"}
        data.raw.technology["Arci-pavement-drive-assistant"].unit = {
            count = 12,
            ingredients = {
                {"nullius-geology-pack", 1},
                {"nullius-climatology-pack", 1},
                {"nullius-mechanical-pack", 1},
                {"nullius-electrical-pack", 1},
            },
            time = 20
        }
        data.raw.technology["Arci-pavement-drive-assistant"].order = "nullius-e-b-a"
    end

    if settings.startup["PDA-setting-smart-roads-enabled"].value then
        local prerequisites

        if settings.startup["PDA-setting-tech-required"].value then
            prerequisites = {"Arci-pavement-drive-assistant", "nullius-personal-transportation-2"}
        else
            prerequisites = {"nullius-personal-transportation-2"}
        end

        data.raw.technology["Arci-smart-road"].prerequisites = prerequisites
        data.raw.technology["Arci-smart-road"].unit = {
            count = 750,
            ingredients = {
                {"nullius-geology-pack", 1},
                {"nullius-climatology-pack", 1},
                {"nullius-mechanical-pack", 1},
                {"nullius-electrical-pack", 1},
                {"nullius-chemical-pack", 1}
            },
            time = 35
        }
        data.raw.technology["Arci-smart-road"].order = "nullius-e-b-a"

        local recipes = {
            "pda-road-sign-speed-limit",
            "pda-road-sign-speed-unlimit",
            "pda-road-sign-stop",
            "pda-road-sensor"
        }
        data.raw.recipe["pda-road-sign-speed-limit"].ingredients = {
            {"constant-combinator", 1},
            {"nullius-processor-1", 1},
        }

        for _,v in pairs(recipes) do
            data.raw.recipe[v].order = "nullius-" .. data.raw.item[v].order
            data.raw.recipe[v].category = "small-crafting"
        end
    end
end