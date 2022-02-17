package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BaraNoYume extends HighSchoolConflict
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/dokidoki/Duet_Assets', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		super.loadMap();
	}

    override function createDadAnimations():Void
    {
        var animation = dad.animation;
        animation.addByPrefix('idle', 'Duet Idle00', 18, false);
        animation.addByPrefix('singUP', 'Duet Monika UP NOTE00', 24, false);
        animation.addByPrefix('singRIGHT', 'Duet Monika RIGHT NOTE00', 24, false);
        animation.addByPrefix('singLEFT', 'Duet Monika LEFT NOTE00', 24, false);
        animation.addByPrefix('singDOWN', 'Duet Monika DOWN NOTE00', 24, false);
        dad.animation = animation;

    }

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle',0, 0);
		dad.addOffset('singRIGHT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singUP', 0, 0);
		dad.dance();
		dad.scale.x = 6;
		dad.scale.y = 6;
		dad.x = 12;
		dad.y = 175;
	}
}