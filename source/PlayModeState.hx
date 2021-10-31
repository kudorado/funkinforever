package;

import haxe.rtti.CType.Path;
import flixel.group.FlxSpriteGroup;
import Options.PcOption;
import extension.admob.AdMob;
import fmf.songs.*;

import ui.FlxVirtualPad.FlxActionMode;
import ui.FlxVirtualPad.FlxDPadMode;
import ui.Controller;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class PlayModeState extends MusicBeatState
{
	static public var instance:PlayModeState;

	var selectedItem:Item;

	var storeLabel:FlxText;

	var options:Array<String> = ['Play Mode'];

	static var curSelection:Int = 0;
	
	public var curPlayMode:Int;

	var txtTracklist:FlxText;
	var txtTapToStart:FlxText;

	var grpWeekText:FlxTypedGroup<SelectionItem>;

	public var grpPlayModes:FlxTypedGroup<PlayModeItem>;

	
	var yellowBG:FlxSprite;

	var selectedPlayMode:PlayModeItem;




	public static var playModeData(get, never):Array<Int>;
	static inline function get_playModeData():Array<Int>
	{
		return FlxG.save.data.playModeData;
	} 


	override function create()
	{

		instance = this;

		AdMob.hideBanner();

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (FlxG.sound.music != null)
		{
			FlxG.sound.playMusic(Paths.music('breakfast'));
		}

		persistentUpdate = persistentDraw = true;

		storeLabel = new FlxText(10, 10, 0, "Play Mode", 36);
		storeLabel.setFormat("VCR OSD Mono", 32);

		storeLabel.screenCenter(X);
		

		//load datas babe

		curPlayMode = FlxG.save.data.playModeId;


		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("vcr.ttf"), 32);
		rankText.size = storeLabel.size;
		rankText.screenCenter(X);

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		yellowBG = new FlxSprite(0, 56);

		loadWeekBG(0);

		grpWeekText = new FlxTypedGroup<SelectionItem>();
		add(grpWeekText);

		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);
		add(blackBarThingie);

		grpPlayModes = new FlxTypedGroup<PlayModeItem>();

		for (i in 0...options.length)
		{
			var weekThing:SelectionItem = new SelectionItem(0, yellowBG.y + yellowBG.height + 10, options[i]);
			weekThing.y += ((weekThing.height + 20) * i);
			weekThing.targetY = i;
			grpWeekText.add(weekThing);

			weekThing.screenCenter(X);
			weekThing.x -= 25;
			weekThing.antialiasing = true;
			weekThing.visible = false;
			// weekThing.updateHitbox();
		}

		for (i in 0...PlayModeManager.playModeList.length)
		{
			var weekThing:PlayModeItem = new PlayModeItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpPlayModes.add(weekThing);
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}

	

		selectedPlayMode = new PlayModeItem(curPlayMode, 0, 0);
		selectedPlayMode.y = yellowBG.y + 175;
		selectedPlayMode.antialiasing = true;

		// gd(selectedVfx);



		add(yellowBG);
		// add(bgShit);

		txtTracklist = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height - 325, 0, "Tracks", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = rankText.font;
		txtTracklist.color = FlxColor.BLACK;

		txtTracklist.alpha = 0;
		txtTracklist.setFormat(Paths.font("vcr.ttf"), 35, FlxColor.WHITE, CENTER);

		txtTracklist.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);

		txtTapToStart = new FlxText(-50, 0, 0, "Press 'A' to start!");
		txtTapToStart.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, CENTER);



		add(txtTracklist);
		// add(rankText);
		add(storeLabel);

		add(grpPlayModes);
		



		updatePlayModeReview();	

		changeSelection(0);
		changeItem(0);

		
		Controller.init(this, LEFT_RIGHT, A_B);

        AdMob.onInterstitialEvent = onRewarded;

		super.create();
	}

	function loadWeekBG(curSelection:Int)
	{
		yellowBG.loadGraphic(Paths.image('configuration')); 
		yellowBG.antialiasing = true;
		yellowBG.screenCenter(X);
	}

	override function update(elapsed:Float)
	{
		updateOverview();

		if (!movedBack)
		{
			if (!selectedWeek)
			{
			

				if (Controller.RIGHT_P)
					changeItem(1);
				if (Controller.LEFT_P)
					changeItem(-1);


				
			}

			if (Controller.ACCEPT)
			{
				select();
			}
		}

		if (Controller.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			FlxG.switchState(new SelectionState());
			
		}

		super.update(elapsed);
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	function select()
	{
		if (options[curSelection].toLowerCase() == 'play')
		{
			//go babe
			FlxG.sound.play(Paths.sound('confirmMenu'));
			new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState(), true);
			});
		}
		else
		{
			selectedItem = null;
			selectedItem = grpPlayModes.members[curPlayMode];

			if (selectedItem == null || selectedItem.isUnlocked)
			{
				// go babe
				FlxG.sound.play(Paths.sound('confirmMenu'));
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState(), true);
				});
			}
			else
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));

				// try unlock it babe
				AdMob.showRewardVideo();
				#if !mobile
				onRewarded("shit");
				#end

			}
		}

	
	}

	function onRewarded(shitReward)
	{
		if(selectedItem != null)
			selectedItem.unlock();
	}
	
//---------------------------------------- DETECT OPTION -----------------------------------

	private function isOverview():Bool
	{
		return curSelection == 1;
	}

	private function isPlayMode():Bool
	{
		return curSelection == 0;
	}

		

//--------------------------------------------------------------------------------------------

	function updateRender()
	{
		grpPlayModes.visible = isPlayMode();
	}

	function changeSelection(change:Int = 0):Void
	{
		curSelection += change;

		if (curSelection >= options.length)
			curSelection = 0;
		if (curSelection < 0)
			curSelection = options.length - 1;

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curSelection;
			if (item.targetY == Std.int(0))
				item.alpha = 1;
			else
				item.alpha = 0.6;
			bullShit++;
		}

		// get first song in the selected week
		FlxG.sound.play(Paths.sound('scrollMenu'));
		
		changeItem(0);
		updateRender();

	}

	function changeItem(change:Int = 0):Void
	{
		changePlayMode(change);
	}

	public function updatePlayModeReview()
	{
		selectedPlayMode.id = FlxG.save.data.playModeId;
		selectedPlayMode.updateUnlockStatus();
		selectedPlayMode.createItemReview();
	}

	
	private function updateOverview()
	{

		updateRender();

		selectedPlayMode.itemReview.visible = true;
		txtTapToStart.visible = isOverview();



	}

	private function changePlayMode(change:Int)
	{
		curPlayMode += change;

		if (curPlayMode < 0)
			curPlayMode = PlayModeManager.playModeList.length - 1;
		if (curPlayMode > PlayModeManager.playModeList.length - 1)
			curPlayMode = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpPlayModes.members[curPlayMode].trySelect();

		updatePlayMode();

	}



	private function updatePlayMode()
	{
		var bullShit:Int = 0;

		for (item in grpPlayModes.members)
		{
			item.targetX = bullShit - curPlayMode;
			if (item.targetX == Std.int(0))
			{
				item.color = item.isUnlocked ? FlxColor.GREEN : FlxColor.WHITE;
				item.alpha = 1;
			}
			else
			{
				item.color = FlxColor.BLACK;
				item.alpha = 0.1;
			}

			bullShit++;
		}
	}

	
}

