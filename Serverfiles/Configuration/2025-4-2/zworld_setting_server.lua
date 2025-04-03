/*
- Product of osgmod.com -
Script create by Nordahl you can find here : https://osgmod.com/gmod-scripts/3945/zworld-gamemode-single-multiplayer
Profile page of the Creator : https://osgmod.com/profiles/76561198033784269

Gmod Script Market Place : https://osgmod.com/gmod-scripts/page-1

- Do not duplicate or reproduce.
- By buying my scripts you contribute to the creations and the updates
- Dont leak, Lack of recognition fuelled by thanks does not bring food to the table
- Respect my work please

Code Minified with Originahl-Scripts Software : https://osgmod.com/en/help/code-minification-optimisation

The satisfied members who offered the coffee and supported me : https://osgmod.com/coffee
*/

local cfg=nordahl_cfg_3945 or {}
nordahl_cfg_3945=cfg

-----VERSION-----
cfg.s_link="https://osgmod.com/gmod-scripts/"
cfg.o_link=cfg.s_link.."3945/zworld-afterlife-gamemode-single-multi"
cfg.Ver="3.8"
cfg.str20="8WP43932DD122691A_42"

-----CONFIGURATION-----
cfg.zworld_resource_workshop	= 0
cfg.topsetting					= 30   -- 30 for TOP 30 if you want a TOP 10 then set it on 10.
cfg.boss_spawn					= 1

----- List of Roles -----
function Staff_LVL(ply,var)return ply:GetNWInt("idnnk")>=cfg.Rank_Power_Access[var] or ply:SteamID64()==cfg.server_owner_id64 end
 
-- cfg.roles_list = Ranked from weakest to most powerful. The number between [ ] is the row level. By Example Super Amind is a role level 50.
cfg.roles_list={
[0]={"Perma Banned",Color(255,0,0)},
[1]={"Banned",Color(255,0,0)},
[10]={"User",Color(255,255,255),1}, -- Default rank.
[14]={"VIP",Color(0,200,0),1},
[15]={"Member",Color(0,200,0),1},
[16]={"Animateur",Color(0,200,0),1},
[17]={"Beta-Tester",Color(0,200,0),1},
[18]={"Streamer",Color(0,200,0),1},
[20]={"Moderator",Color(238,232,170),1},
[30]={"Admin",Color(218,165,32),1},
[39]={"Co-Owner",Color(255,215,0),1},
[40]={"Owner",Color(255,215,0),1},
[45]={"Support",Color(0,150,200),1},
[50]={"SuperAdmin",Color(255,0,0),1},
}

----- Access Roles Level -----
cfg.Rank_Power_Access={
competition_panel_access			= 10, --From what rank is a user can see the competition panel
staff_panel_access					= 20, --From what rank is a user considered as staff?
grant_to_kick						= 50, --From what rank a user can kick
grant_to_ban						= 50, --From what rank a user can ban
grant_no_limit_npcs					= 50, -- At what level can a role spawn more npcs than the limit applied to the configuration file
grant_explosion_tools				= 50, -- Can use explosion tools
grant_spawnmenu_vehicle				= 39, -- Can spawn vehicles from the spawnmenu of Zworld
grant_can_cleanup					= 39, -- Can cleanup the server
can_use_constructions_slot			= 39, -- Can save on the slots the constructions and load.
can_delete_perma_ent_admineye		= 50, -- Can delete the permanent entity
can_use_spectator_mod				= 50, -- Can use Spectator mod
can_kill							= 50, -- Can kill with admin power
grant_use_weapon_adminmod			= 50, -- From which level a role can use a weapon in creator mode
adminmod_can_openinvenotry			= 50, -- From which level a role can use a weapon in creator mode
can_administrate_from_scoreboard	= 50, -- Can administrate from the scoreboard (Without F2)
can_spawn_entity_with_admineye		= 50, -- Can Spawn entity with the Zworld Toolgun (AdminEye)
can_spawn_entity_with_spawnmenu		= 40, -- Can use the spawn menu to spawn items.
can_use_creator_mod					= 50, -- Can use the creator mod
can_customise_the_map				= 50, -- Can customise the map
can_give_money						= 50, -- Can give the money with admin function
access_weather_panel				= 50, -- Can change the weather, seasons and day time.
access_server_setting				= 30, -- Can configure the server from the admin panel
can_launch_link_of_music			= 30, -- Can launch the musics from a link
can_set_svloadingurl				= 50, -- Can edit the svloadingurl
can_change_the_map					= 50, -- Can switch the server map and reboot on the same map
can_set_server_configuration		= 30, -- Can set the server configuration
can_place_makers_on_map				= 30, -- Can place markers on the map (The users will see this points on their paper map and HUD)
can_reloot_furnitures				= 30, -- Can force the reloot of all furnitures
can_restore_tree					= 30, -- Can force the regeneration of all trees
can_edit_users_database				= 50, -- Can edit the database of the users
can_use_teleportation				= 30, -- Can use the Admin teleportations system
can_use_undercover					= 30, -- Can use the undercover
can_send_hord						= 30, -- Can send a hord on a player
can_use_force_model					= 30, -- Force the user to select a new playermodel
can_use_search_in_database			= 50, -- Can use the function Search of the database.
}

----- Game Mecanic -----
cfg.camera_wobble_sway_effect = 1

----- Karma System -----
-- Karma kill points --
cfg.karma_kill_superbandit	= 50
cfg.karma_kill_bandit		= 300
cfg.karma_kill_neutral		= -50
cfg.karma_kill_friendly		= -250
cfg.karma_kill_hero			= -400

-- Set Karma Rank: Names / Limit / Color --

cfg.karma_list={
{"Super Bandit",0,Color(225,0,0)},
{"Bandit",400,Color(200,0,0)},
{"Neutral",500,Color(200,200,200)},
{"Friendly",750,Color(0,175,0)},
{"Hero",1000,Color(0,225,0)},
}

-----CUSTOMISATION-----
cfg.zworld_lock_map_Button		= 0  -- 1 = Lock map buttons, for optimization reasons, it is set on 1 by default. Also for gamemplay reasons, it prevents the game from bypassing generic locks.
cfg.zworld_custom_escapemenu	= 0
cfg.sound={closetab="ambient/machines/keyboard4_clicks.wav",press="ambient/machines/keyboard2_clicks.wav"}

cfg.settings={
{"database_manage",{"ply_online","database_manage","inv_survivors","a_staff","a_accesslist","a_banned","a_vip"},"staff_panel_access"},
{"map_db",{"db_tree","db_fur","db_veh","db_marker","db_fire","db_merchands","db_spawn","db_ghost","ply_construction"},"staff_panel_access"},
{"server_setting",{"server_setting","map_sv","sv_weather",},"staff_panel_access"},
{"zw_spawnmenu",{"zw_spawnmenu","sv_cleanup"},"staff_panel_access"},
{"sv_soundfx",{"sv_soundfx"},"staff_panel_access"},
{"top_player",{"top_survival","top_zkilllife","top_totalzkill","top_playtime","top_kmtravellife","top_lvlmax","top_pvp","top_richest","top_fishing"},"competition_panel_access"},
{"sv_rules",{"sv_rules"},"competition_panel_access"},
}

----- Ban durantion List ----
cfg.ban_duration_list={
{"Ban",1,60},
{"Ban",1,60*5},
{"Ban",1,60*15},
{"Ban",1,60*30},
{"Ban",1,3600},
{"Ban",1,3600*3},
{"Ban",1,86400},
{"Ban",1,86400*7},
{"Ban",1,86400*31},
{"Ban",1,31536000},
{"Perma Banned",0,31536000*99},
}

// VIP STORE OPTIONS Time in seconde: 
cfg.vip_duration_list={
{"VIP Test",30}, -- VIP 30 seconds
{"VIP Test",60*3}, -- VIP 3 minutes
{"VIP",3600}, -- VIP 1 hours
{"VIP",3600*3}, -- VIP 3 hours
{"VIP",86400},  -- VIP 1 Day
{"VIP",86400*7}, -- VIP 1 Week
{"VIP",86400*31}, -- VIP 1 Month (4 Weeks)
{"VIP",31536000}, -- VIP 1 Year
{"VIP for life",31536000*99}, -- VIP for life
}

-- OWNER INFO
cfg.server_owner_avatar		= 'https://cdn.fastly.steamstatic.com/steamcommunity/public/images/items/651670/fedd04d83763222f95b2b706f1409c4ac668ef1c.gif' --YOUR AVATAR
cfg.server_owner_name		= "JpKral" -- YOUR NAME HERE
cfg.server_owner_id64		= "76561198078990078" --YOUR ID64

if cfg.server_owner_name=="Norda" then cfg.server_owner_id64="76561198033784269" end // That its for when I work on my source code because cfg.server_owner_id64 is dynamic, Rename : cfg.server_owner_name to disable it or delete this line.

-- Zworld Alteration of states
cfg.hunger_thirst_cycle=2 -- Cycle in seconds. 2 seconds by defaults.

-- Your Server INFO
cfg.your_forum_link			= "" // Your forum link
cfg.your_discord_link		= "https://discord.gg/knad74g8Yb" // Your Discord link
cfg.your_website_link		= "https://newtownmorrison.noclip.me/" // Your website link
cfg.community_facebook_page	= "" // Your facebook group
cfg.community_steam_group	= "" // Your steam group

-- Zworld Background Images link
cfg.banner_titlescreen1		= "https://i.imgur.com/tqMh34d.png"
cfg.banner_titlescreen2		= "https://i.imgur.com/tbpBP2o.png"
cfg.banner_titlescreen3		= "https://i.imgur.com/zA43OYW.jpg"
cfg.enable_fog_titlescreen1 = 1 -- Enable Norda fog movement system on the titlescreen 1
cfg.enable_fog_titlescreen2 = 1 -- Enable Norda fog movement system on the titlescreen 2

-- Zworld Death Screen Images link
cfg.deathsceen_image_link			= "https://i.imgur.com/FtxTZe4.jpg"
cfg.deathsceen_image_color_alpha	= 175   -- 0 = Invisible (Minimum) > 255 = More visible (Maxi)

-- Zworld Death Screen Images link
cfg.workshop_button_download_map="https://steamcommunity.com/sharedfiles/filedetails/?id=108212613"

-- Zworld Postprocessing
cfg.zworld_Postprocessing	= 1
cfg.zworld_Fog	= 1

-- Zworld Musics
cfg.music_title_screen  = "zworldmusic/zworld_homescreen.mp3"
cfg.snd_title_call		= "zworldeffect/titlecalling2.mp3"

-- Credit System (Zcoin)
cfg.Enable_Zcoin_Store	= 1 -- Inform the users they can buy Credit without being intrusive by leaving the buttons visible. 0 = OFF
cfg.Link_Credit_Store	= "https://newtownmorrison.noclip.me/" --Link of your Store to get Credit (Zcoin) example with mine

-- Admin Tool (AdminEyes)
cfg.tool_ia_max		= 300 -- Maximum AI limit that can be spawned with the admin tool

-- ZWORLD MAP LIST IN THE ADMIN PANEL
cfg.zw_map_list={
{"Outercanals","","rp_outercanals_v3"},
{"Fork","","gm_fork"},
{"Unioncity","","rp_unioncity_day"},
{"Southside","","rp_southside_day"},
{"Truenorth","","rp_truenorth_v1a"},
}

cfg.zworld_map_workshop={
nordahl_workspace={"2467492958"},
gm_fork={"326332456"},
rp_unioncity_day={"1681190843"},
rp_southside_day={"2099209435"},
rp_truenorth_v1a={"1601428630"},
rp_outercanals_v3={"1167050146"},
}

-- Your news in the home screen and escape menu
cfg.enable_ingame_news=1 --1=ON | 0=OFF

-- tab of news that you can edit
cfg.ingame_news={
{"https://i.imgur.com/dsWSDU1.png","https://osgmod.com/gmod-scripts/3945/zworld-gamemode-single-multiplayer","Source Code now on Osgmod ►","6"},
{"https://i.imgur.com/Y4yr7sV.jpg","https://osgmod.com/gmod-scripts/3945/zworld-gamemode-single-multiplayer#wiki","Water System and Collect rainwater","1"},
{"https://i.imgur.com/pZoDKDc.jpg","https://osgmod.com/gmod-scripts/3945/zworld-gamemode-single-multiplayer#wiki","Agricultural production system for survive far of city","2"},
{"https://i.imgur.com/NUuoymA.jpg","https://osgmod.com/gmod-scripts/3945/zworld-gamemode-single-multiplayer#wiki","Fishing your food","3"},
{"https://i.imgur.com/fBn7Dd0.jpg","https://osgmod.com/gmod-scripts/3945/zworld-gamemode-single-multiplayer#wiki","Find mushrooms in wild","4"},
{"https://i.imgur.com/aZDk6Sq.jpg","https://osgmod.com/gmod-scripts/3945/zworld-gamemode-single-multiplayer#wiki","Optimized fire System","0"},
{"https://i.imgur.com/2vdlDdl.jpg","https://osgmod.com/gmod-scripts/page-1","","5"},
}

-- Your Server Rule
cfg.txrule={"1. Cheating or abusing exploits is NOT allowed",
"2. The use of hate speech is NOT allowed. The use of hate speech is NOT allowed",
"3. Griefing/destroying other player structures is NOT allowed (unless to gain access into the base). Only looting is permitted. ",
"4. Use your common sense.",
"5. There are no language requirements. Talk and write in whatever language you want",
"",
"DISCORD: "..cfg.your_discord_link,
"",
"Welcome to New Town Morrison",
"",
"",
"",
"",
"",
""}

cfg.character_starter_pack={
{separ="Free Starter Pack"},
{nom="Alone",inv={},skill=5,zcoin=0},
{nom="The Guide",inv={{"tw_pie",201};{"map",1};{"bou",1};{"t_bot1",1}},skill=10,zcoin=0},
{nom="Chance of survival",inv={{"tw_npl",101};{"hg_ppk",8};{"sm9",30};{"match",30};{"cho",1}},skill=10,zcoin=0},
{nom="Night pack",inv={{"zhf",101};{"tw_fg",2};{"fl",3};{"hg_ppk",8};{"sm9",30};{"lk1",200}},skill=10,zcoin=0},
{nom="The woodcutter",inv={{"tw_axe",201};{"zhf3",101};{"r_t",1}},skill=10,zcoin=0},
{nom="Builder of extreme",inv={{"tw_ham",201};{"tournvis",1};{"nail",20};{"r_b",10}},skill=10,zcoin=0},
{nom="Winter survivalist",inv={{"vdk",4};{"match",1};{"r_p",5};{"r_b",10};{"tw_jery",10};{"pc",1}},skill=10,zcoin=0},
{nom="Farmer",inv={{"tw_pel",101};{"n1",1};{"n9",1};{"n4",1};{"n3",1};{"tw_aro",10};{"ter",1}},skill=10,zcoin=0},
{separ="Zcoin Package (Updated each month with suggestion on the forum)"},
{nom="Gilet Jaune",inv={{"vtm54",21};{"tw_bba",201};{"tr_ml1",4};{"zhf3",101};{"tw_soin",1};{"s_bdaj",1}},skill=20,zcoin=60},
{nom="Doctor Apocalypse",inv={{"vtm53",21};{"tw_soin",1};{"healkit",3};{"s_ab",1};{"sw_mp5",31}},skill=20,zcoin=80},
{nom="Policer Package",inv={{"vtm49",21};{"kevlar",10};{"hg_magnum",7};{"c44",1};{"sw_r870",7};{"she",14};{"zhf2",101};{"lk2",200}},skill=20,zcoin=140},
{nom="Military Package",inv={{"vtm47",21};{"zhf",101};{"kevlar",10};{"casq1",100};{"hg_glock",16};{"m10",45};{"sw_m4a1",31};{"n556",90};{"tr_ml5",3};{"tr_ml6",3};{"tr_ml7",3}},skill=20,zcoin=160},
{nom="David Hasselhoff Package",inv={{"vtm43",21};{"zhf",101};{"kevlar",10};{"casq1",100};{"sw_m249",101};{"n556",100};{"tr_ml5",3};{"tr_ml6",3};{"tr_ml7",3}},skill=20,zcoin=160},
{nom="Wild survivor Package",inv={{"stn",200};{"tw_kni",201};{"tw_bw",401};{"fle",50};{"flf",20};{"tw_fsh",101};{"i1",10};{"gzl",200};{"zhf3",101};{"tn0",200};{"sw_win",3};{"t_bot1",2}},skill=40,zcoin=180},
{nom="Destroyer of Z",inv={{"vtm47",31};{"zhf2",101};{"kevlar",10};{"casq1",100};{"hg_de",8};{"a50",60};{"tw_kni",201};{"tw_bin",1};{"sw_m249",101};{"n556",300};{"tw_rl",2};{"rc",5}},skill=40,zcoin=240},
}

zw_fish_list={
p1={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_fork=1,},bordistmin=5,prfdmin=0,like={i1=1,i2=1,i3=1,i4=1,i5=1,i6=1,i7=1,i8=1,i9=1}},
p2={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_blackwoods2=1},bordistmin=5,prfdmin=0,like={i1=1,i2=1,i3=1,i4=1,i5=1,i9=1}},
p3={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_fork=1},bordistmin=10,prfdmin=2,like={i1=1}},
p4={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_blackwoods2=1},bordistmin=5,prfdmin=0,like={i3=1,i5=1}},
p5={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_blackwoods2=1},bordistmin=5,prfdmin=0,like={i6=1,i8=1}},
p6={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_blackwoods2=1},bordistmin=10,prfdmin=2,like={i4=1}},
p7={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_blackwoods2=1,rp_apocalypse_krypta=1},bordistmin=5,prfdmin=1,like={i1=1}},
p8={spd=2,on_all_maps=true,maps={rp_southside_day=1},bordistmin=10,prfdmin=2,like={i4=1,i7=1}},
p9={spd=2,on_all_maps=true,maps={rp_southside_day=1,gm_fork=1,gm_bay=1},bordistmin=10,prfdmin=2,like={i2=1,i9=1}},
}
