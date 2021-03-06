package state;
import ui.*;
import state.*;
import ui.Controller;
import extension.admob.AdMob;

import openfl.Lib;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

using StringTools;


class PauseSubState extends MusicBeatSubstate
{
	var grpMenuShit:FlxTypedGroup<Alphabet>;

	var menuItems:Array<String> = ['Resume', 'Customization', 'Restart Song', 'Exit to menu'];
	var curSelected:Int = 0;

	var pauseMusic:FlxSound;
	var perSongOffset:FlxText;
	
	var offsetChanged:Bool = false;

	var startDiff:String;
	var levelDifficulty:FlxText;
	var allowChangeDiff:Bool;

	public function new(x:Float, y:Float)
	{
		AdMob.hideBanner();	

		super();

		allowChangeDiff = !GameState.isStoryMode || (GameState.isStoryMode && GameState.storyCompleted);

		// if (GameState.isStoryMode)
			// menuItems = ['Resume', 'Restart Song', 'Exit to menu'];

		//recall pause music shit, idunno why
		GameState.instance.pauseGame();

		
		pauseMusic = new FlxSound().loadEmbedded(Paths.music('breakfast'), true, true);
		pauseMusic.volume = 0;
		pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));

		FlxG.sound.list.add(pauseMusic);

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		bg.screenCenter();
		bg.scaleToFit();
		// if (Main.daTabletShit)
		// {
		// 	bg.scale.x = 1.2;
		// 	bg.scale.y = 1.2;
		// }


		add(bg);

		var levelInfo:FlxText = new FlxText(20, 15, 0, "", 32);
		levelInfo.text += GameState.CURRENT_SONG.toUpperCase();
		levelInfo.scrollFactor.set();
		levelInfo.setFormat(Paths.font("vcr.ttf"), 32);
		levelInfo.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);

		levelInfo.updateHitbox();
		add(levelInfo);

		levelDifficulty = new FlxText(20, 15 + 32, 0, "", 32);
		levelDifficulty.scrollFactor.set();
		levelDifficulty.setFormat(Paths.font('vcr.ttf'), 32);
		levelDifficulty.updateHitbox();
		levelDifficulty.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		
		FreePlayState.changeDiff(levelDifficulty, 0, function()
		{
			levelDifficulty.x = FlxG.width - (levelDifficulty.width + 10);
		});

		if(!allowChangeDiff)
			levelDifficulty.text = '';

		startDiff = levelDifficulty.text;



		add(levelDifficulty);

		levelDifficulty.alpha = 0;
		levelInfo.alpha = 0;

		levelInfo.x = FlxG.width - (levelInfo.width + 20);
		levelDifficulty.x = FlxG.width - (levelDifficulty.width + 20);

		FlxTween.tween(bg, {alpha: 0.85}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(levelInfo, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
		FlxTween.tween(levelDifficulty, {alpha: 1, y: levelDifficulty.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.5});

		grpMenuShit = new FlxTypedGroup<Alphabet>();
		add(grpMenuShit);
		perSongOffset = new FlxText(5, FlxG.height - 18, 0, "Additive Offset (Left, Right): " + GameState.songOffset + " - Description - " + 'Adds value to global offset, per song.', 12);
		perSongOffset.scrollFactor.set();
		perSongOffset.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		
		// #if cpp
		// 	add(perSongOffset);
		// #end

		for (i in 0...menuItems.length)
		{
			var songText:Alphabet = new Alphabet(0, (70 * i) + 30, menuItems[i], true, false);
			songText.isMenuItem = true;
			songText.targetY = i;
			grpMenuShit.add(songText);
		}

		changeSelection();

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];


		Controller.init(this, allowChangeDiff ? FULL : UP_DOWN, A);
        Controller._pad.cameras = [GameState.instance.camOther];



	}

	override function update(elapsed:Float)
	{
		if (pauseMusic.volume < 0.5)
			pauseMusic.volume += 0.01 * elapsed;

		super.update(elapsed);

		var upP = Controller._pad != null && Controller.UP_P;
		var downP =  Controller._pad != null  && Controller.DOWN_P;
		var accepted =  Controller._pad != null && Controller.ACCEPT;





		if (upP)
		{
			changeSelection(-1);
   
		}else if (downP)
		{
			changeSelection(1);
		}

		if (allowChangeDiff)
		{		
			var leftP =  Controller._pad != null && Controller.LEFT_P;
			var rightP = Controller._pad != null && Controller.RIGHT_P;

			if (leftP)
			{
				// FlxG.sound.play(Paths.sound('scrollMenu'));
				FreePlayState.changeDiff(levelDifficulty, -1, function()
				{
					levelDifficulty.x = FlxG.width - (levelDifficulty.width + 10);
				});
			}

			if (rightP)
			{
				FreePlayState.changeDiff(levelDifficulty, 1, function()
				{
					levelDifficulty.x = FlxG.width - (levelDifficulty.width + 10);
				});
			}
		}
		
		// #if cpp
		// 	else if (leftP)
		// 	{
		// 		oldOffset = GameState.songOffset;
		// 		GameState.songOffset -= 1;
		// 		sys.FileSystem.rename(songPath + oldOffset + '.offset', songPath + GameState.songOffset + '.offset');
		// 		perSongOffset.text = "Additive Offset (Left, Right): " + GameState.songOffset + " - Description - " + 'Adds value to global offset, per song.';

		// 		// Prevent loop from happening every single time the offset changes
		// 		if(!offsetChanged)
		// 		{
		// 			grpMenuShit.clear();

		// 			menuItems = ['Restart Song', 'Exit to menu'];

		// 			for (i in 0...menuItems.length)
		// 			{
		// 				var songText:Alphabet = new Alphabet(0, (70 * i) + 30, menuItems[i], true, false);
		// 				songText.isMenuItem = true;
		// 				songText.targetY = i;
		// 				grpMenuShit.add(songText);
		// 			}

		// 			changeSelection();

		// 			cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
		// 			offsetChanged = true;
		// 		}
		// 	}else if (rightP)
		// 	{
		// 		oldOffset = GameState.songOffset;
		// 		GameState.songOffset += 1;
		// 		sys.FileSystem.rename(songPath + oldOffset + '.offset', songPath + GameState.songOffset + '.offset');
		// 		perSongOffset.text = "Additive Offset (Left, Right): " + GameState.songOffset + " - Description - " + 'Adds value to global offset, per song.';
		// 		if(!offsetChanged)
		// 		{
		// 			grpMenuShit.clear();

		// 			menuItems = ['Restart Song', 'Exit to menu'];

		// 			for (i in 0...menuItems.length)
		// 			{
		// 				var songText:Alphabet = new Alphabet(0, (70 * i) + 30, menuItems[i], true, false);
		// 				songText.isMenuItem = true;
		// 				songText.targetY = i;
		// 				grpMenuShit.add(songText);
		// 			}

		// 			changeSelection();

		// 			cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
		// 			offsetChanged = true;
		// 		}
		// 	}
		// #end

		if (accepted)
		{
			var daSelected:String = menuItems[curSelected];

			switch (daSelected)
			{
				case "Resume":
					if (startDiff.toLowerCase() == levelDifficulty.text.toLowerCase())
					{
						close();
						GameState.instance.restorePad();
					}
					else
					{
						GameState.instance.disableCameras();
						LoadingState.showAlert(this, "Change difficult to " + levelDifficulty.text.toUpperCase(), null, function()
						{
							GameState.instance.gameNa();
							close();
							GameState.instance.restorePad();
							AdMob.showInterstitial(60);

							GameState.instance.switchState(function()
							{
								LoadingState.setStaticTransition();
								FlxG.resetState();
							});
						});
				
					}
				case "Restart Song":
					GameState.instance.disableCameras();
					GameState.instance.gameNa();
					close();
					GameState.instance.restorePad();
					AdMob.showInterstitial(60);
					GameState.instance.switchState(function()
					{
						LoadingState.setStaticTransition();
						FlxG.resetState();
					});

				case 'Customization':
					GameState.instance.disableCameras();
					GameState.instance.gameNa();
					close();
					GameState.instance.restorePad();
					AdMob.showInterstitial(60);

					GameState.instance.switchState(function()
					{
						FlxG.switchState(new SelectionState());
					});
					
				case "Exit to menu":
					GameState.instance.disableCameras();
					GameState.instance.gameNa();
					close();
					GameState.instance.restorePad();

					AdMob.showInterstitial(60);
					
					GameState.instance.switchState(function()
					{
						if (GameState.isStoryMode)
							FlxG.switchState(new StoryState());
						else
							FlxG.switchState(new FreePlayState());
						
					});

			}
		}

		if (FlxG.keys.justPressed.J)
		{
			// for reference later!
			// PlayerSettings.player1.controls.replaceBinding(Control.LEFT, Keys, FlxKey.J, null);
		}
	}

	override function destroy()
	{
		pauseMusic.destroy();
		super.destroy();
	}

	function changeSelection(change:Int = 0):Void
	{
		curSelected += change;

		if (curSelected < 0)
			curSelected = menuItems.length - 1;
		if (curSelected >= menuItems.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpMenuShit.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}