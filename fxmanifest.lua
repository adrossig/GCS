fx_version 'adamant'
game { 'gta5', 'rdr3' }

author 'An awesome dude named Lusaka'
description 'Core of the framework GCS (Game Core System)'
version '0.0.1'

resource_type 'gametype' { name = 'My awesome game type!' }

ui_page 'gcs_core/client/html/index.html'

client_script {
	-- Import function
	--	'gcs_core/data/import.lua',

	-- Shared gamemode module
		'gcs_core/src/shared/game/fivem.lua',
		'gcs_core/src/shared/lua-overloads/*.lua',
		'gcs_core/src/shared/lua-additions/*.lua',
		'gcs_core/src/shared/object-oriented/module_class.lua', -- no class instances on initial frame before this file
		'gcs_core/src/shared/object-oriented/module_getter_setter.lua', -- getter_setter, getter_setter_encrypted
		'gcs_core/src/shared/object-oriented/moudle_oop.lua', -- is_class_instance
		'gcs_core/src/shared/standalone-data-structures/*', -- Enum, IdPool
		'gcs_core/src/shared/math/*.lua',
		'gcs_core/src/shared/shared/enums/*.lua', -- load all Enums
		'gcs_core/src/shared/events/*.lua', -- Events class
		'gcs_core/src/shared/value-storage/*.lua', -- ValueStorage class
		'gcs_core/src/shared/timer/*.lua', -- Timer class
		'gcs_core/src/shared/xml/*.lua', -- XML class
		'gcs_core/src/shared/csv/*.lua', -- CSV class
		'gcs_core/src/shared/colors/*.lua',

	-- Client gamemode module
		'gcs_core/src/client/enums/*.lua',
		'gcs_core/src/client/network/*.lua', -- Network class
		'gcs_core/src/client/typecheck/*.lua', -- TypeCheck class
		'gcs_core/src/client/asset-requester/*.lua',
		'gcs_core/src/client/entity/*.lua', -- Entity class
		'gcs_core/src/client/player/module.lua',
		'gcs_core/src/client/player/module_players.lua',
		'gcs_core/src/client/player/module_manager.lua',
		'gcs_core/src/client/ped/*.lua', -- Ped class
		'gcs_core/src/client/physics/*.lua',
		'gcs_core/src/client/localplayer/*.lua', -- LocalPlayer class
		'gcs_core/src/client/render/*.lua',
		'gcs_core/src/client/camera/*.lua', -- Camera class
		'gcs_core/src/client/blip/*.lua', -- Blip class
		'gcs_core/src/client/object/*.lua', -- Object, ObjectManager classes
		'gcs_core/src/client/screen-effects/*.lua', -- ScreenEffects class
		'gcs_core/src/client/world/*.lua',
		'gcs_core/src/client/sound/*.lua', -- Sound class
		'gcs_core/src/client/light/*.lua', -- Light class
		'gcs_core/src/client/particle-effect/*.lua', -- ParticleEffect class
		'gcs_core/src/client/anim-post-fx/*.lua', -- AnimPostFX class
		'gcs_core/src/client/volume/*.lua', -- Volume class
		'gcs_core/src/client/explosion/*.lua', -- Explosion class
		'gcs_core/src/client/pause-menu/*.lua', -- PauseMenu class
		'gcs_core/src/client/hud/*.lua', -- HUD class
		'gcs_core/src/client/keypress/*.lua',
		'gcs_core/src/client/prompt/*.lua', -- Prompt class
		'gcs_core/src/client/map/*.lua', -- Imap/Ipl class
		'gcs_core/src/client/marker/*.lua', -- Marker class
		'gcs_core/src/client/water/*.lua', -- Water class
		'gcs_core/src/client/ui/module.lua',
		'gcs_core/src/client/localplayer_behaviors/*.lua',
		'gcs_core/src/client/weapons/*.lua',

	-- Events module
		'events/client/*.lua',
		'events/shared/*.lua',

	-- SpawnManager module
		'spawnmanager/client/*.lua',
	
	-- LOAD LAST init module
		'gcs_core/src/shared/init.lua'
}

server_script {
	-- SQL libs 
		'@mysql-async/lib/MySQL.lua',

	-- Import function
	--	'gcs_core/data/import.lua',

	-- Shared gamemode module
		'gcs_core/src/shared/game/fivem.lua',
		'gcs_core/src/shared/lua-overloads/*.lua',
		'gcs_core/src/shared/lua-additions/*.lua',
		'gcs_core/src/shared/object-oriented/module_class.lua', -- no class instances on initial frame before this file
		'gcs_core/src/shared/object-oriented/module_getter_setter.lua',
		'gcs_core/src/shared/object-oriented/module_oop.lua', -- is_class_instance
		'gcs_core/src/shared/math/*.lua',
		'gcs_core/src/shared/standalone-data-structures/*', -- Enum, IdPool
		'gcs_core/src/shared/shared/enums/*.lua', -- load all the enums from all the modules
		'gcs_core/src/shared/colors/*.lua',
		'gcs_core/src/shared/events/*.lua', -- Events class
		'gcs_core/src/shared/value-storage/*.lua', -- ValueStorage class
		'gcs_core/src/shared/timer/*.lua', -- Timer class
		'gcs_core/src/shared/xml/*.lua', -- XML class
		'gcs_core/src/shared/csv/*.lua', -- CSV class

	-- Server gamemode module
		'gcs_core/src/server/sConfig.lua',
		'gcs_core/src/server/network/*.lua', -- Network class
		'gcs_core/src/server/json/*.lua', -- JsonOOF, JsonUtils classes
		'gcs_core/src/server/fs-additions/*.lua', -- Directory/file exists helper functions
		'gcs_core/src/server/mysql/*.lua',
		'gcs_core/src/server/key-value-store/*.lua',
		'gcs_core/src/server/player/module.lua', -- Player class
		'gcs_core/src/server/player/module_players.lua', -- Players class
		'gcs_core/src/server/player/module_manager.lua', -- PlayerManager class
		'gcs_core/src/server/entity/*.lua', -- Entity class
		'gcs_core/src/server/ped/*.lua', -- Ped class
		'gcs_core/src/server/world/*.lua', -- World class

	-- Events module
		'events/server/*.lua',
		'events/shared/*.lua',

	-- SpawnManager module
		'spawnmanager/server/*.lua',

	-- Load last
		'gcs_core/src/shared/init.lua',
}

files {
	-- Import function
		'gcs_core/data/import.lua',

	-- Data files
		'GCS_framework/data/*.json',

	-- UI module of the framework
		'gcs_core/html/css/*.css',
		'gcs_core/html/js/*.js',
		'gcs_core/html/index.html',
}