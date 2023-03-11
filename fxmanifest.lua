fx_version 'adamant'

game 'gta5'

description 'ESX Vehicle Lock'

version '1.0.0'

server_script {
	'@es_extended/locale.lua',
	'server/*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/*.lua'
}

shared_scripts {
    'shared/*.lua',
}

dependencies {
	'es_extended',
}
