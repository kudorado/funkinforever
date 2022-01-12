package fmf.songs;
import state.*;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Run extends SongPlayer
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/bobismad/hellbob_assets', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{

		gamePlayState.defaultCamZoom = 0.8;

		var bg:FlxSprite = new FlxSprite(-400, -300).loadGraphic(Paths.image('bg/bob/hell', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.5;
		bg.scale.x = 1.5;
		gamePlayState.add(bg);

		var bgmid:FlxSprite = new FlxSprite(-400, -300).loadGraphic(Paths.image('bg/bob/middlething', 'mods'));
		bgmid.antialiasing = true;
		bgmid.scale.y = 1.5;
		bgmid.scale.x = 1.5;
		gamePlayState.add(bgmid);

		var theydead:FlxSprite = new FlxSprite(-400, -300).loadGraphic(Paths.image('bg/bob/theydead', 'mods'));
		theydead.antialiasing = true;
		theydead.scale.y = 1;
		theydead.scale.x = 1;
		gamePlayState.add(theydead);


		var stageFront:FlxSprite = new FlxSprite(-650, -600).loadGraphic(Paths.image('bg/bob/ground', 'mods'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		gamePlayState.add(stageFront);

	}

	private override function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'bobismad', 24, true);
		animation.addByPrefix('singUP', 'bobismad', 24, false);
		animation.addByPrefix('singRIGHT', 'bobismad', 24, false);
		animation.addByPrefix('singLEFT', 'bobismad', 24, false);
		animation.addByPrefix('singDOWN', 'bobismad', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -2);
		dad.addOffset("singUP", -15, 4);
		dad.addOffset("singRIGHT", -6, -1);
		dad.addOffset("singLEFT", -16, -3);
		dad.addOffset("singDOWN", -14, -8);
		dad.dance();


		dad.scale.x = 1;
		dad.scale.y = 1;

		dad.x -= 200;
		dad.y += 50;

		dad.flipX = true;

		dad.lockAnim(999);

	}
	
	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		
		bf.x += 250;
		bf.y -= 150;
	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
		gf.y -= 200;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('bg/bob/iconGrid', 'mods'), true, 150, 150);
		icon.animation.add('dad', [28, 29], 0, false, false);
		icon.animation.play("dad");
	}
}