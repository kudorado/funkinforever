package fmf.songs;

import fmf.characters.*;
import flixel.FlxG;
import flixel.FlxSprite;

class Spookez extends SongPlayer
{


	var halloweenBG:FlxSprite;
	var lightningStrikeBeat:Int = 0;
	var lightningOffset:Int = 8;

	override function loadMap()
	{
		var hallowTex = Paths.getSparrowAtlas('halloween_bg');
		halloweenBG = new FlxSprite(-200, -100);
		halloweenBG.frames = hallowTex;
		halloweenBG.animation.addByPrefix('idle', 'halloweem bg0');
		halloweenBG.animation.addByPrefix('lightning', 'halloweem bg lightning strike', 24, false);
		halloweenBG.animation.play('idle');
		halloweenBG.antialiasing = true;
		playState.add(halloweenBG);
	}

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf/GF_normal');
		gf.frames = tex;
    }

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
		dad.frames = tex;
	}

	override function getDadVersion():Character
	{
		return new Spooky(100, 100);
	}

   
	override function createDadAnimations():Void
	{
		var animation = dad.animation;
      
        animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
        animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
        animation.addByPrefix('singLEFT', 'note sing left', 24, false);
        animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
        animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
        animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);
		dad.animation = animation;

	}

	override function createDadAnimationOffsets():Void
	{
        dad.addOffset('danceLeft');
        dad.addOffset('danceRight');

        dad.addOffset("singUP", -20, 26);
        dad.addOffset("singRIGHT", -130, -14);
        dad.addOffset("singLEFT", 130, -10);
        dad.addOffset("singDOWN", -50, -130);
		
		dad.dance();

		dad.x -= 250;
        dad.y += 50;

	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y -= 125;
	}

	override function createBFAnimationOffsets()
	{
        bf.x += 50;
		super.createBFAnimationOffsets();
	}

	override function midSongEventUpdate(curBeat:Int):Void
	{
		if (FlxG.random.bool(10) && curBeat > lightningStrikeBeat + lightningOffset)
		{
			if (FlxG.save.data.distractions)
			{
				lightningStrikeShit(curBeat);
			}
		}
	}

	function lightningStrikeShit(curBeat:Int):Void
	{
		FlxG.sound.play(Paths.soundRandom('thunder_', 1, 2));
		halloweenBG.animation.play('lightning');

		lightningStrikeBeat = curBeat;
		lightningOffset = FlxG.random.int(8, 24);

		bf.playAnimForce('scared', 0.5);
		gf.playAnimForce('scared', 0.5);
	}


	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [2, 3], 0, false, false);
		icon.animation.play("dad");
	}
	
}