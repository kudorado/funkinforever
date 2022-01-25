package fmf.characters;

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
	var healthicon:String;

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

//abstract class shit fuck you
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

    //brilliant gooo brrr
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

    //shit
    override function update(elapsed:Float)
    {
        onUpdate(elapsed);
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

}
