package state;
import state.*;
import reactor.*;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import fmf.characters.*;
import fmf.songs.*;
/**
	*DEBUG MODE
 */
enum DebugCharacter
{	
	BF;
	DAD;
	GF;
}
class AnimationState extends FlxState
{

	var char:Character;
	var textAnim:FlxText;
	var dumbTexts:FlxTypedGroup<FlxText>;
	var animList:Array<String> = [];
	var curAnim:Int = 0;
	var camFollow:FlxObject;

	var flipBF:Bool;

	var debugCharacter:DebugCharacter;
	public static var isActive:Bool;

	public function new(debugChar:DebugCharacter, flipBF:Bool = false)
	{
		super();
		this.debugCharacter = debugChar;
		this.flipBF = flipBF;
	}


	override function destroy()
	{
		isActive = false;
		super.destroy();
	}
	override function create()
	{
		isActive = true;
		FlxG.sound.music.stop();

		// GameState.instance.initCharacterGroups();

		var gridBG:FlxSprite = FlxGridOverlay.create(10, 10);
		gridBG.scrollFactor.set(0.5, 0.5);
		add(gridBG);

		//@notrace("get song: " + GameState.RAW_SONG_NAME);
		if (debugCharacter == DAD)
		{
			var song = SongPlayerManager.getCurrentSong(GameState.RAW_SONG_NAME);

			song.createDad();

			var dad = song.dad;
			dad.debugMode = true;
			dad.screenCenter();
			add(dad);

			char = dad;
			char.flipX = false;
		}
		else if(debugCharacter == BF)
		{
			var song = SongPlayerManager.getCurrentSong(GameState.RAW_SONG_NAME);
			song.createBF();
			song.createStoryBF();
			
			var bf = song.bf;
			bf.debugMode = true;
			bf.screenCenter();
			add(bf);
			char = bf;


			//debug for enemy babe
			if (flipBF)
				char.flipX = !char.flipX;

			// bf.flipX = true;
		}

		else if (debugCharacter == GF)
		{
			var song = SongPlayerManager.getCurrentSong(GameState.RAW_SONG_NAME);
			song.createGF();
			
			var gf = song.gf;
			gf.debugMode = true;
			gf.screenCenter();
			add(gf);
			char = gf;
		}

		dumbTexts = new FlxTypedGroup<FlxText>();
		add(dumbTexts);

		textAnim = new FlxText(300, 16);
		textAnim.size = 26;
		textAnim.scrollFactor.set();
		add(textAnim);

		genBoyOffsets();

		camFollow = new FlxObject(0, 0, 2, 2);
		camFollow.screenCenter();
		add(camFollow);

		FlxG.camera.follow(camFollow);


		super.create();
	}

	function genBoyOffsets(pushList:Bool = true):Void
	{
		var daLoop:Int = 0;

		for (anim => offsets in char.animOffsets)
		{
			var text:FlxText = new FlxText(10, 20 + (18 * daLoop), 0, anim + ": " + offsets, 15);
			text.scrollFactor.set();
			text.color = FlxColor.BLUE;
			dumbTexts.add(text);

			if (pushList)
				animList.push(anim);

			daLoop++;
		}
	}

	function updateTexts():Void
	{
		dumbTexts.forEach(function(text:FlxText)
		{
			text.kill();
			dumbTexts.remove(text, true);
		});
	}

	override function update(elapsed:Float)
	{
		if (char.animation.curAnim == null)
			return;

		textAnim.text = char.animation.curAnim.name;

		if (FlxG.keys.justPressed.E)
			FlxG.camera.zoom += 0.25;
		if (FlxG.keys.justPressed.Q)
			FlxG.camera.zoom -= 0.25;

		if (FlxG.keys.pressed.I || FlxG.keys.pressed.J || FlxG.keys.pressed.K || FlxG.keys.pressed.L)
		{
			if (FlxG.keys.pressed.I)
				camFollow.velocity.y = -90;
			else if (FlxG.keys.pressed.K)
				camFollow.velocity.y = 90;
			else
				camFollow.velocity.y = 0;

			if (FlxG.keys.pressed.J)
				camFollow.velocity.x = -90;
			else if (FlxG.keys.pressed.L)
				camFollow.velocity.x = 90;
			else
				camFollow.velocity.x = 0;
		}
		else
		{
			camFollow.velocity.set();
		}

		if (FlxG.keys.justPressed.W)
		{
			curAnim -= 1;
		}

		if (FlxG.keys.justPressed.S)
		{
			curAnim += 1;
		}

		if (curAnim < 0)
			curAnim = animList.length - 1;

		if (curAnim >= animList.length)
			curAnim = 0;

		if (FlxG.keys.justPressed.S || FlxG.keys.justPressed.W || FlxG.keys.justPressed.SPACE)
		{
			char.playAnim(animList[curAnim]);

			updateTexts();
			genBoyOffsets(false);
		}

		var upP = FlxG.keys.anyJustPressed([UP]);
		var rightP = FlxG.keys.anyJustPressed([RIGHT]);
		var downP = FlxG.keys.anyJustPressed([DOWN]);
		var leftP = FlxG.keys.anyJustPressed([LEFT]);

		var holdShift = FlxG.keys.pressed.SHIFT;
		var multiplier = 1;
		if (holdShift)
			multiplier = 10;

		if (upP || rightP || downP || leftP)
		{
			updateTexts();
			if (upP)
				char.animOffsets.get(animList[curAnim])[1] += 1 * multiplier;
			if (downP)
				char.animOffsets.get(animList[curAnim])[1] -= 1 * multiplier;
			if (leftP)
				char.animOffsets.get(animList[curAnim])[0] += 1 * multiplier;
			if (rightP)
				char.animOffsets.get(animList[curAnim])[0] -= 1 * multiplier;

			updateTexts();
			genBoyOffsets(false);
			char.playAnim(animList[curAnim]);
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new GameState());
		}
		super.update(elapsed);
	}
}
