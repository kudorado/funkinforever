package fmf.songs;
import state.*;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GarcelloTired extends Garcello
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/garcellotired/garcello_tired', 'mods');
		dad.frames = tex;
	}
	

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Garcellotired idle dance', 24, false);
		animation.addByPrefix('cough', 'Garcellotired cough', 24, false);
		animation.addByPrefix('singUP', 'Garcellotired Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcellotired Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'Garcellotired Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'Garcellotired Sing Note DOWN0', 24, false);

		animation.addByPrefix('singUP-alt', 'Garcellotired Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Garcellotired Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Garcellotired Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Garcellotired Sing Note DOWN0', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('cough',-2, -38);
		dad.addOffset('singUP-alt', -4, -38);
		dad.addOffset('singRIGHT-alt', -10 , -38);
		dad.addOffset('singLEFT-alt',33, -41);
		dad.addOffset('singDOWN-alt', -11, -42);
		
		super.createDadAnimationOffsets();

	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [26, 27], 0, false, false);
		icon.animation.play("dad");
	}


	override function midSongEventUpdate(curBeat:Int)
	{
		switch(curBeat)
		{
			case 7 | 61 | 63  | 65  | 67  | 69  | 111 | 182: 

				dad.playAnim('cough', true);
				dad.lockAnim(0.35, function()
				{
					dad.dance();
				});
		}

	}

}