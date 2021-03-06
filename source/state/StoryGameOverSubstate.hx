package state;

import fmf.characters.*;
import ui.*;

import ui.Controller;
import ui.FlxVirtualPad;
import extension.admob.AdMob;
import Controls.Control;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxCamera;

class StoryGameOverSubstate extends MusicBeatSubstate
{
	public var boyfriend:Character;
	var camFollow:FlxPoint;
	var camFollowPos:FlxObject;
	var updateCamera:Bool = false;

	var stageSuffix:String = "";

	public static var characterName:String = 'bfDeath';
	public static var deathSoundName:String = 'fnf_loss_sfx';
	public static var loopSoundName:String = 'gameOver';
	public static var endSoundName:String = 'gameOverEnd';

	public static var instance:StoryGameOverSubstate;

	public static function resetVariables() {
		characterName = 'bf';
		deathSoundName = 'fnf_loss_sfx';
		loopSoundName = 'gameOver';
		endSoundName = 'gameOverEnd';
	}

	override function create()
	{
		instance = this;
		GameState.instance.callOnLuas('onGameOverStart', []);
		super.create();
	}

	public function new(x:Float, y:Float, camX:Float, camY:Float)
	{
		super();

		GameState.instance.setOnLuas('inGameOver', true);

		Conductor.songPosition = 0;

		boyfriend = new BoyfriendDeath(x, y);
		add(boyfriend);

		camFollow = new FlxPoint(boyfriend.getGraphicMidpoint().x, boyfriend.getGraphicMidpoint().y);

		FlxG.sound.play(Paths.sound(deathSoundName));
		Conductor.changeBPM(100);
		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		boyfriend.playAnim('firstDeath');

		var exclude:Array<Int> = [];

		camFollowPos = new FlxObject(0, 0, 1, 1);
		camFollowPos.setPosition(FlxG.camera.scroll.x + (FlxG.camera.width / 2), FlxG.camera.scroll.y + (FlxG.camera.height / 2));
		add(camFollowPos);


		#if mobile 
			createMobileControls();
		#end

		#if !mobile
		#if debug
			createMobileControls();
		#end
		#end
	}

	function createMobileControls()
	{
		var camcontrol = new FlxCamera();
		FlxG.cameras.add(camcontrol);
		camcontrol.bgColor.alpha = 0;
		Controller.init(this, NONE, A_B);
		Controller._pad.cameras = [camcontrol];
	}

	var isFollowingAlready:Bool = false;
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		// GameState.instance.callOnLuas('onUpdate', [elapsed]);
		if(updateCamera) {
			var lerpVal:Float = CoolUtil.boundTo(elapsed * 0.6, 0, 1);
			camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));
		}

		if (Controller.ACCEPT)
		{
			endBullshit();
		}

		if (Controller.BACK)
		{
			FlxG.sound.music.stop();
			GameState.deathCounter = 0;
			GameState.seenCutscene = false;

			LoadingState.createBlackFadeIn(this, function()
			{
				if (GameState.isStoryMode)
					FlxG.switchState(new StoryState());
				else
					FlxG.switchState(new FreePlayState());
			}, GameState.instance.camHUD);

			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			GameState.instance.callOnLuas('onGameOverConfirm', [false]);
		}

		if (boyfriend.animation.curAnim.name == 'firstDeath')
		{
			if(boyfriend.animation.curAnim.curFrame >= 12 && !isFollowingAlready)
			{
				FlxG.camera.follow(camFollowPos, LOCKON, 1);
				updateCamera = true;
				isFollowingAlready = true;
			}

			if (boyfriend.animation.curAnim.finished)
			{
				coolStartDeath();
				// boyfriend.startedDeath = true;
			}
		}

		if (FlxG.sound.music.playing)
		{
			#if debug
			Conductor.songPosition = FlxG.sound.music.time * FlxG.timeScale;
			#else
			Conductor.songPosition = FlxG.sound.music.time;
			#end
		}
		GameState.instance.callOnLuas('onUpdatePost', [elapsed]);
	}

	override function beatHit()
	{
		super.beatHit();

		//FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function coolStartDeath(?volume:Float = 1):Void
	{
		FlxG.sound.playMusic(Paths.music(loopSoundName), volume);
	}

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			boyfriend.playAnim('deathConfirm', true);
	
			GameState.instance.gameNa();
			AdMob.showInterstitial(60);
			// FlxG.sound.play(Paths.music('gameOverEnd'));
			LoadingState.createBlackFadeIn(this, function()
			{
				FlxG.resetState();
			}, GameState.instance.camHUD);
                
			GameState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
	}
}
