package fmf.songs;
import state.*;
import flixel.addons.effects.FlxTrail;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Sadness extends SongPlayer	
{
	var gfanim:FlxSprite = new FlxSprite(620, 180);
	var bfanim:FlxSprite = new FlxSprite(990, 500);
	
	var noise:FlxSprite = new FlxSprite(-80);
	var glitchs:FlxSprite = new FlxSprite();
	var rageAnim1:FlxSprite = new FlxSprite(25, 239);
	var rageAnim2:FlxSprite = new FlxSprite(25, 239);
	var rageAnim3:FlxSprite = new FlxSprite(200, 350);
	var faces:FlxSprite = new FlxSprite(-220, 100);
	public var sura:FlxSprite = new FlxSprite(157, -260);
	public var sura2:FlxSprite = new FlxSprite(157, -260);
	public var sur:FlxSprite = new FlxSprite(157, -260);
	public static var trollvar:Bool = false;
	public static var finalvar:Bool = false;
	var bunda:FlxTrail;
	var sadnessTrail:FlxTrail;
	var rageTrail:FlxTrail;
	var isTrollge:Bool = false;
	var isTrollge2:Bool = false;
	var su:Float = 0;
	var su2:Int = 0;
	var bt:FlxSprite = new FlxSprite(600, 400);
	var whito:FlxSprite = new FlxSprite(157, -260);
	var whito2:FlxSprite = new FlxSprite(157, -260);
	var bbg:FlxSprite = new FlxSprite(157, -260);
	var bbg2:FlxSprite = new FlxSprite(157, -260);
	var bgt:FlxSprite = new FlxSprite(157, -260);
	var back1:FlxSprite = new FlxSprite(157, -260);
	var sadgli:FlxSprite = new FlxSprite(157, -260);
	var bgo:FlxSprite = new FlxSprite(157, -260);
	var soe:FlxSprite = new FlxSprite(157, -260);
	var bt2:FlxSprite = new FlxSprite(600, 400);
	var bt3:FlxSprite = new FlxSprite(600, 400);
	var bt4:FlxSprite = new FlxSprite(600, 400);
	var bt5:FlxSprite = new FlxSprite(600, 400);
	var not:FlxSprite = new FlxSprite(0, 0);
	var valuer:Int = 200;
	var nummber:Int = 2;
	public static var samanta:Bool = true;
	public static var samanta2:Bool = true;
	public static var samanta3:Bool = true;

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('pc/blueballs_incident/SadSheet', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
        gamePlayState.defaultCamZoom = 0.85;
		var bg:FlxSprite = new FlxSprite(157, -426).loadGraphic(Paths.image('bg/blueballs_incident/sadi/sad', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1.2;
		bg.scale.x = 1.2;
		gamePlayState.add(bg);
	}

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('gf_skins/trollge/gf_trollge', 'mods');
		gf.frames = tex;
	}


	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'TrollfaceIdle0', 9, false);
		animation.addByPrefix('singUP', 'TrollfaceUp00', 24, false);
		animation.addByPrefix('singRIGHT', 'TrollfaceRight00', 24, false);
		animation.addByPrefix('singLEFT', 'TrollfaceLeft00', 24, false);
		animation.addByPrefix('singDOWN', 'TrollfaceDown00', 24, false);
		dad.animation = animation;

	}

	override function createStoryBF()
	{
		changePc('bf trollge');
		bf.x += 806;
		bf.y += 290;
	}

	override function createDadAnimationOffsets():Void
	{

        dad.addOffset('idle',0, 23);

		dad.addOffset('singUP', -41, 21);
		dad.addOffset('singRIGHT', 81, 8);
		dad.addOffset('singLEFT', 72, 6);
		dad.addOffset('singDOWN', -19, -30);
		dad.dance();
		
        dad.scale.x = 1.2;
        dad.scale.y = 1.2;
		dad.x = 722;
		dad.y = 250;
	
	}

	override function createBFAnimationOffsets()
	{
		super.createBFAnimationOffsets();
		bf.x += 809;
		bf.y += 50;

	}

	override function createGFAnimationOffsets()
	{
		super.createGFAnimationOffsets();
        gf.x = 1246;
		gf.y = 82;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();
		gamePlayState.targetCamFollow.y -= 50;
		gamePlayState.defaultCamZoom = 0.85;

	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowBF();

		gamePlayState.defaultCamZoom = 0.7;
		gamePlayState.targetCamFollow.x += 150;
		gamePlayState.targetCamFollow.y += 25;

	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('health_icon/blueballs', 'mods'), true, 150, 150);
		icon.animation.add('dad', [25, 26], 0, false, false);
		icon.animation.play("dad");
	}

}
