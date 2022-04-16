package fmf.characters;

import fmf.characters.*;
import fmf.characters.BaseCharacter.CharacterFile;
import state.*;
// import animateatlas.AtlasFrameMaker;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.effects.FlxTrail;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxTween;
import flixel.util.FlxSort;
import Section.SwagSection;
#if MODS_ALLOWED
import sys.io.File;
import sys.FileSystem;
#end
import openfl.utils.AssetType;
import openfl.utils.Assets;
import haxe.Json;
import haxe.format.JsonParser;

// import fmf.characteres.CharacterMixes.CharacterType;
using StringTools;

class CharacterPE extends Character
{
	//i dunno how to name this
	public var handsome:Bool = true;

	override function onCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
		peOnCreate(x, y, character, isPlayer);
	}

	override function onUpdate(elapsed:Float)
	{
		peOnUpdate(elapsed);
	}

	function peOnCreate(x:Float, y:Float, ?character:String = 'bf', ?isPlayer:Bool = false)
	{
		characterType = PsychEngine;

		#if (haxe >= "4.0.0")
		animOffsets = new Map();
		#else
		animOffsets = new Map<String, Array<Dynamic>>();
		#end
		curCharacter = character;
		this.isPlayer = isPlayer;
		antialiasing = true; // true; //true; //ClientPrefs.globalAntialiasing;
		var library:String = null;
		switch (curCharacter)
		{
			// case 'your character name in case you want to hardcode them instead':

			default:
				var daLibrary = 'mods';

				var songFolder = GameState.playingSong.folder;
				var imgDirectory = "psychengine/" + songFolder;



				var dataDirectory = "images/psychengine/" + songFolder;

				var characterPath:String = dataDirectory + "characters/" + curCharacter + '.json';

				var path:String = Paths.getPath(characterPath, TEXT, daLibrary);

				trace('char path: ' + path);
				var rawJson = Assets.getText(path);
				// lime.app.Application.current.window.alert(characterPath, 'Raw Json');

				var json:CharacterFile = cast Json.parse(rawJson);
				var spriteType = "sparrow";
				// sparrow
				// packer
				// texture

				var sharedSongFolder = json.sharedSongFolder;

				var daTexture = "images/" + json.image;
				
				if (sharedSongFolder != null && sharedSongFolder != "")
				{
					imgDirectory = "psychengine/" + sharedSongFolder + "/";
				}

				// trace('get character at path: ' + imgDirectory + daTexture);

				switch (spriteType)
				{
					case "packer":
						frames = Paths.getPackerAtlas(imgDirectory + daTexture, daLibrary);

					case "sparrow":
						frames = Paths.getSparrowAtlas(imgDirectory + daTexture, daLibrary);

						// case "texture":
						// frames = AtlasFrameMaker.construct(imgDirectory + json.image, daLibrary);
				}

				imageFile = daTexture;

				if (json.scale != 1)
				{
					jsonScale = json.scale;
					setGraphicSize(Std.int(width * jsonScale));
					updateHitbox();
				}

				positionArray = json.position;
			
				cameraPosition = json.camera_position;

				healthIcon = json.healthicon;
				singDuration = json.sing_duration;
				flipX = !!json.flip_x;




				
				if (x == 700 && y == 200)
				{
					//default, attemp load in array
					this.x = positionArray[0];
					this.y = positionArray[1];
				}
				else
				{
					//load it by passed value
					this.x = x;
					this.y = y;
				}

				if (json.no_antialiasing)
				{
					antialiasing = false;
					noAntialiasing = true;
				}

				if (json.healthbar_colors != null && json.healthbar_colors.length > 2)
					healthColorArray = json.healthbar_colors;

				antialiasing = !noAntialiasing;
				// if(!true; //ClientPrefs.globalAntialiasing) antialiasing = false;

				animationsArray = json.animations;
				if (animationsArray != null && animationsArray.length > 0)
				{
					for (anim in animationsArray)
					{
						var animAnim:String = '' + anim.anim;
						var animName:String = '' + anim.name;
						var animFps:Int = anim.fps;
						var animLoop:Bool = !!anim.loop; // Bruh
						var animIndices:Array<Int> = anim.indices;
						if (animIndices != null && animIndices.length > 0)
						{
							animation.addByIndices(animAnim, animName, animIndices, "", animFps, animLoop);
						}
						else
						{
							animation.addByPrefix(animAnim, animName, animFps, animLoop);
						}

						if (anim.offsets != null && anim.offsets.length > 1)
						{
							addOffset(anim.anim, anim.offsets[0], anim.offsets[1]);
						}
					}
				

				}
				else
				{
					quickAnimAdd('idle', 'BF idle dance');
				}
				// trace('Loaded file to character ' + curCharacter);
		}
		originalFlipX = flipX;

		if (animOffsets.exists('singLEFTmiss') || animOffsets.exists('singDOWNmiss') || animOffsets.exists('singUPmiss') || animOffsets.exists('singRIGHTmiss'))
			hasMissAnimations = true;
		recalculateDanceIdle();
		dance();

		if (isPlayer)
		{
			flipX = !flipX;
		}
	}

	function peOnUpdate(elapsed:Float)
	{
		if (!debugMode && animation.curAnim != null)
		{
			if (heyTimer > 0)
			{
				heyTimer -= elapsed;
				if (heyTimer <= 0)
				{
					if (specialAnim && animation.curAnim.name == 'hey' || animation.curAnim.name == 'cheer')
					{
						specialAnim = false;
						dance();
					}
					heyTimer = 0;
				}
			}
			else if (specialAnim && animation.curAnim.finished)
			{
				specialAnim = false;
				dance();
			}

			if (!isPlayer)
			{
				if (animation.curAnim.name.startsWith('sing'))
				{
					holdTimer += elapsed;
				}

				if (holdTimer >= Conductor.stepCrochet * 0.001 * singDuration)
				{
					dance();
					holdTimer = 0;
				}


			}

			if (animation.curAnim.finished && animation.getByName(animation.curAnim.name + '-loop') != null)
			{
				playAnim(animation.curAnim.name + '-loop');
			}
		}
	}

	function peDance()
	{
		if (!debugMode && !specialAnim)
		{
			if (danceIdle)
			{
				trace("peDance idle: " + danceIdle);

				danced = !danced;

				if (danced)
					playAnim('danceRight' + idleSuffix);
				else
					playAnim('danceLeft' + idleSuffix);
			}
			else if (animation.getByName('idle' + idleSuffix) != null)
			{

				trace("peDance suffix: " + idleSuffix);
				playAnim('idle' + idleSuffix);
			}
		}
	}

	function pePlayAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0)
	{
		if (isLockAnim)
			return;

		if (AnimName == 'idle' && animation.getByName('idle' + idleSuffix) != null)
		{
			// trace('change idle to: idle' + idleSuffix);
			AnimName = ('idle' + idleSuffix);
		}

		specialAnim = false;
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter.startsWith('gf'))
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	function peAddOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}

	/**
	 * FOR GF DANCING SHIT
	 */
	public override function dance()
	{
		peDance();
	}

	public override function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		if (animation.getByName(AnimName) != null)
			pePlayAnim(AnimName, Force, Reversed, Frame);
	}

	public override function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		peAddOffset(name, x, y);
	}
}