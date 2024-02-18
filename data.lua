if mods["nullius"] then
    require("nullius-data")
--not possible for both to be installed anyway
elseif mods["Ultracube"] then
    require("ultracube-data")
end