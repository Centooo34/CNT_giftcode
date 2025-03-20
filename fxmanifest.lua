
fx_version 'cerulean'
game 'gta5'
lua54 "yes"
version '1.0.0'

author 'Cento'
description 'Gift Code Script using ox_lib made by Cento'

client_scripts {
    '@ox_lib/init.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

shared_script '@es_extended/imports.lua'

dependencies {
    'ox_inventory',
    'ox_lib',
    'es_extended'
}
