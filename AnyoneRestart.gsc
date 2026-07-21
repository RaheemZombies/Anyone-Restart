/*
*	 Black Ops 2 - GSC Studio by iMCSx
*
*	 Creator : Chris
*	 Project : NewProject2342
*    Mode : Zombies
*	 Date : 2026/07/20 - 21:36:11	
*
*/	

#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;

init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
    for(;;)
    {
	self waittill( "spawned_player" );
	wait 3;
	anyonerestart();
    }
}

anyonerestart()
{
	while( 1 )
	{
		foreach( player in level.players )
		{
			if( self meleebuttonpressed() && self fragbuttonpressed() )
			{
				wait .25;
				if( self meleebuttonpressed() && self fragbuttonpressed() )
			{
				map_restart( 0 );
			}
			}
		}
		wait 0.1;
	}

}

