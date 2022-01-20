package fmf.songs;
import reactor.*;
import ui.*;

import state.*;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Clown
{
	public var gameState(get, never):GameState;
	public inline function get_gameState()
		return GameState.instance;
	
	public static var TrickyLinesSing:Array<String> = ["SUFFER", "TIKY", "SUS", "IIMARKY", "NANOBIT", "INCORRECT", "INCOMPLETE", "INSUFFICIENT", "INVALID", "CORRECTION", "MISTAKE", "REDUCE", "ERROR", "ADJUSTING", "IMPROBABLE", "IMPLAUSIBLE", "MISJUDGED"];
	public static var TrickyLinesMiss:Array<String> = ["TERRIBLE", "WASTE", "MISS CALCULTED", "PREDICTED", "FAILURE", "DISGUSTING", "ABHORRENT", "FORESEEN", "CONTEMPTIBLE", "PROGNOSTICATE", "DISPICABLE", "REPREHENSIBLE"];

	public var resetSpookyText:Bool = true;
	public var spookyText:FlxText;
	public var spookyRendered:Bool = false;
	public var spookySteps:Int = 0;
	public var tstatic:FlxSprite; 
	public var stepOfLast = 0;


	public function createStaticBG()
	{
		tstatic = new FlxSprite(0, 0).loadGraphic(Paths.image('TrickyStatic', 'shared'), true, 320, 180);
		tstatic.antialiasing = true;
		tstatic.scrollFactor.set(0,0);
		tstatic.setGraphicSize(Std.int(tstatic.width * 8.3));
		tstatic.screenCenter(X);
		
		tstatic.animation.add('static', [0, 1, 2], 24, true);
		tstatic.animation.play('static');

		tstatic.alpha = 0;

		gameState.add(tstatic);
	}

	public function new()
	{
		//init clown babe
	}

	public function createText(x:Float, y:Float)
	{
		var text:String = TrickyLinesSing[FlxG.random.int(0, TrickyLinesSing.length - 1)];
		createSpookyText(text, x, y);
	}


	public function createMissText(x:Float, y:Float)
	{
		var text:String = TrickyLinesMiss[FlxG.random.int(0, TrickyLinesMiss.length - 1)];
		createSpookyText(text, x, y);
	}

		

	public function createSpookyText(text:String, x:Float = -1111111111111, y:Float = -1111111111111):Void
	{
		spookySteps = gameState.curStep;
		spookyRendered = true;
		tstatic.alpha = 0.5;
		FlxG.sound.play(Paths.sound('staticSound', 'preload'));
		spookyText = new FlxText(FlxG.random.float(x + 40,x + 120), FlxG.random.float(y + 200, y));
		spookyText.setFormat("Impact", 128, FlxColor.RED);
		spookyText.size = 100;
		spookyText.x += 50;
		spookyText.bold = true;
		spookyText.text = text;

		gameState.add(spookyText);
	}

	public function update(elapsed:Float)
	{
		// this is where I overuse FlxG.Random :)
		if (spookyRendered) // move shit around all spooky like
		{
			spookyText.angle = FlxG.random.int(-5, 5); // change its angle between -5 and 5 so it starts shaking violently.
			// tstatic.x = tstatic.x + FlxG.random.int(-2,2); // move it back and fourth to repersent shaking.
			if (tstatic.alpha != 0)
				tstatic.alpha = FlxG.random.float(0.1, 0.5); // change le alpha too :)
		}
	}

	public function automaticRemoveSpooky()
	{
		if (spookyRendered && spookySteps + 3 < gameState.curStep)
		{
			if (resetSpookyText)
			{
				gameState.remove(spookyText);
				spookyRendered = false;
			}

			tstatic.alpha = 0;
		}
	}

	public function noteEvent(daNote:Note, x:Float, y:Float)
	{
		createText(x, y);
	}

	public function midSongStepUpdate()
	{
		automaticRemoveSpooky();
	}
	

}