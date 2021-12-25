package fmf.songs;

import fmf.vfx.VFX;
import fmf.skins.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TripleTrouble extends SussusMoogus
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/impostor_v4/maroon', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Maroon idle00', 24, false);
		animation.addByPrefix('singUP', 'Maroon up00', 24, false);
		animation.addByPrefix('singRIGHT', 'Maroon right0', 24, false);
		animation.addByPrefix('singLEFT', 'Maroon left00', 24, false);
		animation.addByPrefix('singDOWN', 'Maroon down00', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
		dad.addOffset('idle', 0, -0);
		dad.addOffset('singUP', -88, 0);
		dad.addOffset('singRIGHT', -93, -0);
		dad.addOffset('singLEFT', -12, -0);
		dad.addOffset('singDOWN', -87, -0);

		dad.scale.x = 1;
		dad.scale.y = 1;
		dad.x = -110;
		dad.y = 368;
		dad.dance();

	}

    public override function getDadIcon(icon:HealthIcon)
    {
        icon.loadGraphic(Paths.image('health_icon/impostor_v4/icons/icon-maroon', 'mods'), true, 150, 150);
        icon.animation.add('dad', [0, 1], 0, false, false);
        icon.animation.play("dad");
    }
}