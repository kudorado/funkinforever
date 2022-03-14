package state;

import state.*;
import ui.*;


import flixel.FlxCamera;
import ui.Controller;
import ui.FlxVirtualPad;
import extension.admob.AdMob;
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


class VictorySubState extends MusicBeatSubstate
{
    var grpMenuShit:FlxTypedGroup<Alphabet>;

    var menuItems:Array<String> = ['Next Song', 'Exit to menu'];
    var curSelected:Int = 0;

    var pauseMusic:FlxSound;

    var mode:String;
    var levelDifficulty:FlxText;
    
    var allowChangeDiff:Bool;


    public function new(x:Float, y:Float)
    {
   
        AdMob.hideBanner();

        super();

        GameState.instance.pauseGame();
        allowChangeDiff = !GameState.isStoryMode || (GameState.isStoryMode && GameState.storyCompleted);


        if (GameState.isStoryMode)
			menuItems = ['Next Song', 'Exit to menu'];


        pauseMusic = new FlxSound().loadEmbedded(Paths.music('breakfast', 'shared'), true, true);
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
		// 	bg.scale.x = Main.shitZoom;
		// 	bg.scale.y = Main.shitZoom;
		// }
        add(bg);



        var bg1:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('victoryBG'));
        bg1.scrollFactor.x = 0;
        bg1.scrollFactor.y = 0;
        bg1.screenCenter();
        bg1.scaleToFit();

        bg1.antialiasing = true;

		// if (Main.daTabletShit)
		// {
		// 	bg1.scale.x = Main.shitZoom;
		// 	bg1.scale.y = Main.shitZoom;
		// }

        add(bg1);


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
        levelDifficulty.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
        levelDifficulty.updateHitbox();
		FreePlayState.changeDiff(levelDifficulty, 0, function()
		{
			levelDifficulty.x = FlxG.width - (levelDifficulty.width + 10);
		});

		if (!allowChangeDiff)
			levelDifficulty.text = '';

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

        for (i in 0...menuItems.length)
        {
            var songText:Alphabet = new Alphabet(0, (70 * i) + 30, menuItems[i], true, false);
            songText.isMenuItem = true;
            songText.targetY = i;
            grpMenuShit.add(songText);

            songText.screenCenter(X);
        }

        changeSelection();


    
		LoadingState.createBlackFadeOut(this, GameState.instance.camHUD);
      
        cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
        

		Controller.init(this, allowChangeDiff ? FULL : UP_DOWN, A);

        var shitCam = new FlxCamera();
		shitCam.bgColor.alpha = 0;
		FlxG.cameras.add(shitCam);
        Controller._pad.cameras = [shitCam];

    }

    override function update(elapsed:Float)
    {
        if (pauseMusic.volume < 0.5)
            pauseMusic.volume += 0.01 * elapsed;

        super.update(elapsed);


		if (allowChangeDiff)
		{
			if (Controller.LEFT_P)
			{
				// FlxG.sound.play(Paths.sound('scrollMenu'));
				FreePlayState.changeDiff(levelDifficulty, -1, function()
				{
					levelDifficulty.x = FlxG.width - (levelDifficulty.width + 10);
				});
			}

			if (Controller.RIGHT_P)
			{
				FreePlayState.changeDiff(levelDifficulty, 1, function()
				{
					levelDifficulty.x = FlxG.width - (levelDifficulty.width + 10);
				});
			}
		}

        if (Controller.UP_P)
        {
            // FlxG.sound.play(Paths.sound('scrollMenu'));
            changeSelection(-1);
        }
        if (Controller.DOWN_P)
        {
            // FlxG.sound.play(Paths.sound('scrollMenu'));
            changeSelection(1);
        }

        if (Controller.ACCEPT)
        {
            var daSelected:String = menuItems[curSelected];
            GameState.instance.disableCameras();
            Controller._pad.visible = false;

            switch (daSelected)
            {
                case "Next Song":
					GameState.instance.gameNa();
                    AdMob.showInterstitial(60);
                    LoadingState.createBlackFadeIn(this, function()
					{
                        LoadingState.createEmptyBlack(this);
                        LoadingState.loadAndSwitchState(new GameState(), true);
					}, null);
				          

				case 'Customization':
                    GameState.instance.gameNa();
                    AdMob.showInterstitial(60);

                    LoadingState.createBlackFadeIn(this, function()
					{
                        LoadingState.createEmptyBlack(this);
                        FlxG.switchState(new SelectionState());
					}, null);

                case "Exit to menu":
					GameState.instance.gameNa();
                    AdMob.showInterstitial(60);

					// FlxG.sound.play(Paths.music('gameOverEnd'));
					LoadingState.createBlackFadeIn(this, function()
					{
                        LoadingState.createEmptyBlack(this);

						if (GameState.isStoryMode)
							FlxG.switchState(new StoryState());
						else
							FlxG.switchState(new FreePlayState());
					}, null);

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

            if (item.targetY == 0)
            {
                item.alpha = 1;
            }
        }
    }
}
