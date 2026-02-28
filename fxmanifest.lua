fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Saint'
description 'Figherfighting job'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/framework.lua',
    'shared/inventory.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Remove if using mysql-async
    'server/database.lua',
}

client_scripts {
}

dependencies {
    'ox_lib'
}
