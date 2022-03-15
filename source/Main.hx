package;
import state.*;
import openfl.display.BlendMode;
import openfl.text.TextFormat;
import openfl.display.Application;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.Assets;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;

class Main extends Sprite
{
	#if Portrait
	var gameWidth:Int = 720; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 1280; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	#else
	var gameWidth:Int = 1280; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 720; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	#end
	var initialState:Class<FlxState> = StartState; // The FlxState the game starts with.
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets
	public static var watermarks = true; // Whether to put Kade Engine liteartly anywhere
	
	// this is fucking shit make by kudorado
	public static var shitZoom:Float = 1.2;
	public static var fuckZoom:Float;
	public static var daTabletShit:Bool;


	#if android
	public static var path:String = lime.system.System.applicationStorageDirectory;
	#else
	public static var path:String = '';
	#end

	// You can pretty much ignore everything from here on - your code should go in your states.

	public static var fx:Float;
	public static var fy:Float;

	public static function main():Void
	{

		// quick checks 
		Lib.current.addChild(new Main());
	}

	public function clamp(raw:Float, min:Float, max:Float)
	{
		if (raw < min)
			raw = min;
		if (raw > max)
			raw = max;

		return raw;
	}


	public function new()
	{
		super();

		if (stage != null)
		{
			init();
		}
		else
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}


		#if debug
		var performance = new Performance(null,        //any font you want
											null, // null or any BitmapData (suggested 50x50pixels)
										  true,  // true if you want to see the APP information
										  true); // true if you want to see the FPS Graph
		Lib.current.stage.addChild(performance);
		#end

	}

	private function init(?E:Event):Void
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}

		setupGame();
	}

	var stageWidth:Int;
	var stageHeight:Int;

	private function setupGame():Void
	{
		stageWidth = Lib.current.stage.stageWidth;
		stageHeight = Lib.current.stage.stageHeight;

		//debug resolution
		// 
		stageWidth = 720;
		stageHeight = 1280;
		
		trace('stage-w-h: ' + stageWidth + "," + stageHeight);

		#if Portrait
		portraitAspect();
		#else
		landscapeAspect();
		#end

		#if !debug
		initialState = StartState;
		#end

		game = new FlxGame(gameWidth, gameHeight, initialState, zoom, framerate, framerate, skipSplash, startFullscreen);

		addChild(game);

		#if !mobile
		fpsCounter = new FPS(10, 3, 0xFFFFFF);
		addChild(fpsCounter);
		toggleFPS(FlxG.save.data.fps);

		#end
	}

	var game:FlxGame;

	var fpsCounter:FPS;

	public function toggleFPS(fpsEnabled:Bool):Void {
		fpsCounter.visible = fpsEnabled;
	}

	function landscapeAspect()
	{
		trace('Calculate landscape aspect...');

		var kudoradoHandsome:Bool = true;
		var daFactor:Float = (stageWidth / (stageHeight * 1.0));
		trace('daFactor: ' + daFactor);

		if (kudoradoHandsome == true)
		{			
			if (daFactor > 1.6) // wide phone
			{
				if (daFactor > 2)
				{
					#if ios
					//oh shit rabbit ears, or super long phone
					stageWidth -= (209 * 2);
					#end
				}

				fx = stageWidth / gameWidth;
				fy = stageHeight / gameHeight;
				zoom = Math.max(fx, fy);

			}
			else // tablet
			{
				fx = stageWidth / gameWidth;
				fy = stageHeight / gameHeight;

				zoom = Math.min(fx, fy);
				daTabletShit = true;
				trace('oh my gosh, tablet shit!');
			}

			fuckZoom = zoom;

			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);

			trace("game-w-h: " + gameWidth + ',' + gameHeight);
			trace('fucking zoom: ' + zoom);
		}
	}


	function portraitAspect()
	{
		trace('Calculate portrait aspect...');

		var kudoradoHandsome:Bool = true;
		var daFactor:Float = (stageWidth / (stageHeight * 1.0));

		trace('daFactor: ' + daFactor);


		if (kudoradoHandsome == true)
		{
			if (daFactor <= 0.6) // wide phone
			{
				if (daFactor < 0.48)
				{
					#if ios
					// oh shit rabbit ears, or super long phone
					stageHeight -= (209 * 2);
					#end
				}

				fx = stageWidth / gameWidth;
				fy = stageHeight / gameHeight;
				zoom = Math.min(fx, fy);
			}
			else // tablet
			{
				fx = stageWidth / gameWidth;
				fy = stageHeight / gameHeight;

				zoom = Math.max(fx, fy);
				daTabletShit = true;
				trace('oh my gosh, tablet shit!');
			}

			fuckZoom = zoom;

			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);

			trace('fucking zoom: ' + zoom);
			trace("game-w-h: " + gameWidth + ',' + gameHeight);
		}
	}
	

	public function changeFPSColor(color:FlxColor)
	{
		fpsCounter.textColor = color;
	}

	public function setFPSCap(cap:Float)
	{
		openfl.Lib.current.stage.frameRate = cap;
	}

	public function getFPSCap():Float
	{
		return openfl.Lib.current.stage.frameRate;
	}

	public function getFPS():Float
	{
		return fpsCounter.currentFPS;
	}
}
