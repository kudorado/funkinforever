package fmf.characters;

import state.*;


import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import haxe.Json;

using StringTools;


enum CharacterType
{
    Default;
    PsychEngine;

}
//shit


//------------------_PsychEngine_-------------------------------------------------------------------------

typedef CharacterFile =
{
	var animations:Array<AnimArray>;
	var image:String;
	var scale:Float;
	var sing_duration:Float;
	public var healthicon:String;

	var position:Array<Float>;
	var camera_position:Array<Float>;
	var flip_x:Bool;
	var no_antialiasing:Bool;
	var healthbar_colors:Array<Int>;
}

typedef AnimArray =
{
	var anim:String;
	var name:String;
	var fps:Int;
	var loop:Bool;
	var indices:Array<Int>;
	var offsets:Array<Int>;
}

//---------------------------------------------------------------------------------------------------
// abstract class shit fuck you
class BaseCharacter extends FlxSprite
{
	public var characterType:CharacterType;
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;
	public var holdTimer:Float = 0;
	public var stunned:Bool;

	public var isVisible:Bool = true;

	public var daBF = false;
	public var label:String;

	private var danced:Bool = false;
	private var isLockAnim:Bool;

	//------------------_PsychEngine_-------------------------------------------------------------------------
	public var isPlayer:Bool = false;
	public var curCharacter:String = DEFAULT_CHARACTER;

	public var colorTween:FlxTween;
	public var heyTimer:Float = 0;
	public var specialAnim:Bool = false;
	public var animationNotes:Array<Dynamic> = [];
	public var singDuration:Float = 4; // Multiplier of how long a character holds the sing pose
	public var idleSuffix:String = '';
	public var danceIdle:Bool = false; // Character use "danceLeft" and "danceRight" instead of "idle"

	public var alreadyLoaded:Bool;

	public var healthIcon:String = 'face';
	public var animationsArray:Array<AnimArray> = [];

	public var positionArray:Array<Float> = [0, 0];
	public var cameraPosition:Array<Float> = [0, 0];

	public var hasMissAnimations:Bool = false;

	// Used on Character Editor
	public var imageFile:String = '';
	public var jsonScale:Float = 1;
	public var noAntialiasing:Bool = false;
	public var originalFlipX:Bool = false;
	public var healthColorArray:Array<Int> = [255, 0, 0];

	public static var DEFAULT_CHARACTER:String = 'bf'; // In case a character is missing, it will use BF on its place

	//-------------------------------------------------------------------------------------------
	// brilliant gooo brrr
	public function new(x:Float = 700, y:Float = 200, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
		super(x, y);
		onCreate(x, y, character, isPlayer);
	}

	function onCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
	}

	public function onUpdate(elapsed:Float)
	{
	}

	// shit
	override function update(elapsed:Float)
	{
		onUpdate(elapsed);
		if (pc())
		{
			if (GameState.playAsDad)
			{
				dadBehaviour(elapsed);
			}
			else
			{
				bfBehaviour(elapsed);
			}
		}
		super.update(elapsed);
	}

	//-----------------------------_ES_----------------------------------------------------------

	public function bindAnim()
	{
		isLockAnim = true;
	}

	public function lockAnim(duration:Float, callback:Void->Void = null)
	{
		if (isLockAnim)
			return;

		isLockAnim = true;
		new FlxTimer().start(duration, function(tmr:FlxTimer)
		{
			isLockAnim = false;

			if (callback != null)
				callback();
		});
	}

	//------------------------------------------------------------------------------------------------
	//----------------------_PsychEngine_--------------------------------------------------------------------------

	public function recalculateDanceIdle()
	{
		danceIdle = (animation.getByName('danceLeft' + idleSuffix) != null && animation.getByName('danceRight' + idleSuffix) != null);
	}

	public function quickAnimAdd(name:String, anim:String)
	{
		animation.addByPrefix(name, anim, 24, false);
	}

	//------------------------------------------------------------------------------------------------
	//-----------------------------------Playable Character --------------------------------------------

	//pc shit
	function pc()
		return false;


	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
        animOffsets[name] = [x, y];
	}

	// create animation offset for BF
	public function createAnimationOffsets():Void
	{
		addOffset('idle', -0, -0);
		addOffset("singUP", -0, 0);
		addOffset("singRIGHT", -0, -0);
		addOffset("singLEFT", 0, -0);
		addOffset("singDOWN", -0, -0);

		addOffset("singUPmiss", -0, 0);
		addOffset("singRIGHTmiss", -0, 0);
		addOffset("singLEFTmiss", -0, -0);
		addOffset("singDOWNmiss", -0, -0);
		addOffset("hey", -0, 0);
		addOffset('scared', -0, 0);

		addOffset('hit', -0, 0);
		addOffset('hurt', -0, 0);
		addOffset('scared', -0, 0);
		addOffset('dodge', -0, 0);

		playAnim('idle');
		flipX = false;
	}


	public function playAnimForce(anim:String, lockDuration:Float, callback:Void->Void = null)
	{
		if (animation.getByName(anim) == null) // no anim found babe
			return;

		if (isLockAnim)
			return;

		if (!isVisible)
			return;

		if (callback == null)
		{
			// create default callback
			callback = function()
			{
				playAnim('idle', true);
			};
		}

		playAnim(anim, true);
		lockAnim(lockDuration, callback);
	}
		


	// create BF
	public function createCharacter():Void
	{
		getTex();
		createAnimations();
		createAnimationOffsets();
	}

	public function hey()
	{
		if (heyable)
			playAnimForce('hey', 0.35);
	}

	public function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/bf/BoyFriend_Assets', 'mods');
		frames = tex;
	}

	// should pa heyable!
	private var heyable:Bool;

	public var gameState(get, never):GameState;

	public inline function get_gameState()
		return GameState.instance;


	// create animation for BF
	public function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24, false);
		animation.addByPrefix('hurt', 'BF hit0', 24, false);
		animation.addByPrefix('hit', 'BF hit0', 24, false);
		animation.addByPrefix('dodge', 'Boyfriend dodge0', 24, false);

		// custom event for bf, only have in some mods
		// nosense shit
		// animation.addByPrefix('bruh', 'BF bruh0', 24);
		// animation.addByPrefix('dab', 'BF dab0', 24);
		// animation.addByPrefix('gun', 'BF gun away0', 24);
		// animation.addByPrefix('idle-derp', 'BF idle Derp0', 24);
	}

	// note event shit for BF
	public function noteEventBF(noteData:Note)
	{
	}

	public function noteEventDad(noteData:Note)
	{
	}

	public function midSongStepUpdate()
	{
	}

	public function characterCreatedEvent()
	{
	}

	public function characterAddedEvent()
	{
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		if (animation.getByName(AnimName) != null)
		{
			if (isLockAnim)
				return;

			if (!isVisible)
				return;

			if (daBF && AnimName.contains("-alt")) // ah shit fuck you
			{
				var daString:String = AnimName;
				if (animation.getByName(AnimName) == null)
				{
					daString = daString.replace('-alt', '');
					AnimName = (daString);
				}
			}

			animation.play(AnimName, Force, Reversed, Frame);

			var daOffset = animOffsets.get(AnimName);
			if (animOffsets.exists(AnimName))
			{
				offset.set(daOffset[0], daOffset[1]);
			}
			else
				offset.set(0, 0);
		}
	}

	private function bfBehaviour(elapsed:Float)
	{
		if (animation == null || animation.curAnim == null || animation.curAnim.name == null)
			return;

		if (animation.curAnim.name.startsWith('sing'))
		{
			holdTimer += elapsed;
		}
		else
			holdTimer = 0;

		if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
		{
			playAnim('idle'); // , true, false, 10);
		}
	}

	private function dadBehaviour(elapsed:Float)
	{
		if (animation == null || animation.curAnim == null || animation.curAnim.name == null)
			return;

		if (animation.curAnim.name.startsWith('sing'))
		{
			holdTimer += elapsed;
		}
		else
			holdTimer = 0;

		var dadVar:Float = 6.1;

		if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001 && !debugMode)
		{
			dance();
			holdTimer = 0;
		}
	}
	
	public function dance():Void
	{
		playAnim('idle');
	}	

}
