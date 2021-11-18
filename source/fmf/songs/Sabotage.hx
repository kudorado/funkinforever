package fmf.songs;

//import js.html.rtc.PeerConnectionIceEvent;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Sabotage extends SussusMoogus	
{
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/sus/impostor', 'mods');
		dad.frames = tex;
	}

    override  function getGFTex() {
		var text = Paths.getSparrowAtlas('gf_skins/gfghost/gfghost', 'mods');
		gf.frames = text;
	}

	override function loadMap()
	{
        super.loadMap();
		playState.defaultCamZoom = 0.8;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.scale.x = 1.5;
        gf.scale.y = 1.5;
        gf.x += 200;
        gf.y += 150;
	}
}