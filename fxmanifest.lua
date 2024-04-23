fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'CertifiedStag'
name 'Dashcam Removal'
description 'Easy Removal of Dashcams'
version '1.0'

shared_scripts {
    'config.lua',
}

client_scripts {
    'cl_dashcams.lua',
}

server_scripts {
    'sv_dashcams.lua',
}