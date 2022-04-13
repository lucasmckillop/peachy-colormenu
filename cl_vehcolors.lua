-- CONFIG AREA BELOW --
local config = config or {} -- DON'T TOUCH


config.key = 'F7'
config.commandName = 'colormenu'
config.jobs = {
    { job = 'police' },
    { job = 'ambulance' }
}
-- CONFIG AREA ABOVE --



local colormenu = nativetheme and MenuV:CreateMenu('Color Menu', '', 'topright', 220, 20, 60, 'size-125', 'default', 'menuv', 'colormenu', 'native') or MenuV:CreateMenu(false, 'Color Menu', 'topright', 220, 20, 60, 'size-125', 'none', 'menuv', 'colormenu')
local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand(config.commandName, function(source)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local ped = PlayerPedId()
    local source = src
    local veh = GetVehiclePedIsIn(ped)
    for k,v in pairs(config.jobs) do
        if PlayerData.job.name == v.job then
            if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(veh, -1) == ped then
                MenuV:OpenMenu(colormenu)
            end
        end
    end
end)

RegisterKeyMapping(config.commandName, 'Open Color Menu', 'keyboard', config.key)

local colors = {
    {name = "Black", id = 0},
    {name = "Carbon Black", id = 147},
    {name = "Graphite", id = 1},
    {name = "Anhracite Black", id = 11},
    {name = "Black Steel", id = 11},
    {name = "Dark Steel", id = 3},
    {name = "Silver", id = 4},
    {name = "Bluish Silver", id = 5},
    {name = "Rolled Steel", id = 6},
    {name = "Shadow Silver", id = 7},
    {name = "Stone Silver", id = 8},
    {name = "Midnight Silver", id = 9},
    {name = "Cast Iron Silver", id = 10},
    {name = "Red", id = 27},
    {name = "Torino Red", id = 28},
    {name = "Formula Red", id = 29},
    {name = "Lava Red", id = 150},
    {name = "Blaze Red", id = 30},
    {name = "Grace Red", id = 31},
    {name = "Garnet Red", id = 32},
    {name = "Sunset Red", id = 33},
    {name = "Cabernet Red", id = 34},
    {name = "Wine Red", id = 143},
    {name = "Candy Red", id = 35},
    {name = "Hot Pink", id = 135},
    {name = "Pfsiter Pink", id = 137},
    {name = "Salmon Pink", id = 136},
    {name = "Sunrise Orange", id = 36},
    {name = "Orange", id = 38},
    {name = "Bright Orange", id = 138},
    {name = "Gold", id = 99},
    {name = "Bronze", id = 90},
    {name = "Yellow", id = 88},
    {name = "Race Yellow", id = 89},
    {name = "Dew Yellow", id = 91},
    {name = "Dark Green", id = 49},
    {name = "Racing Green", id = 50},
    {name = "Sea Green", id = 51},
    {name = "Olive Green", id = 52},
    {name = "Bright Green", id = 53},
    {name = "Gasoline Green", id = 54},
    {name = "Lime Green", id = 92},
    {name = "Midnight Blue", id = 141},
    {name = "Galaxy Blue", id = 61},
    {name = "Dark Blue", id = 62},
    {name = "Saxon Blue", id = 63},
    {name = "Blue", id = 64},
    {name = "Mariner Blue", id = 65},
    {name = "Harbor Blue", id = 66},
    {name = "Diamond Blue", id = 67},
    {name = "Surf Blue", id = 68},
    {name = "Nautical Blue", id = 69},
    {name = "Racing Blue", id = 73},
    {name = "Ultra Blue", id = 70},
    {name = "Light Blue", id = 74},
    {name = "Chocolate Brown", id = 96},
    {name = "Bison Brown", id = 101},
    {name = "Creeen Brown", id = 95},
    {name = "Feltzer Brown", id = 94},
    {name = "Maple Brown", id = 97},
    {name = "Beechwood Brown", id = 103},
    {name = "Sienna Brown", id = 104},
    {name = "Saddle Brown", id = 98},
    {name = "Moss Brown", id = 100},
    {name = "Woodbeech Brown", id = 102},
    {name = "Straw Brown", id = 99},
    {name = "Sandy Brown", id = 105},
    {name = "Bleached Brown", id = 106},
    {name = "Schafter Purple", id = 71},
    {name = "Spinnaker Purple", id = 72},
    {name = "Midnight Purple", id = 142},
    {name = "Bright Purple", id = 145},
    {name = "Cream", id = 107},
    {name = "Ice White", id = 111},
    {name = "Frost White", id = 112}
}

    local veh = GetVehiclePedIsIn(PlayerPedId())
    local prmColor, secColor = GetVehicleColor(veh)
    for k, v in pairs(colors) do
            colormenu:AddButton({
                label = v.name,
                description = 'Set color to' .. v.name,
                select = function()
                    SetVehicleColours(veh, v.id, secColor)
                    print(v.id)
                end})
    end
