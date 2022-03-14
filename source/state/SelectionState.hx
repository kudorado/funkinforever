package state;

import state.*;
import selection.*;

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

//custom transition data
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxRect;
import flixel.math.FlxPoint;

using StringTools;

class SelectionState extends MusicBeatState
{
	static public var instance:SelectionState;

	var selectedItem:Item;

	var storeLabel:FlxText;

	var options:Array<String> = ['Play', 'Characters', "Notes", "Effects", 'Controls', 'Scrolls',  "Play Mode"];

	var txtTracklist:FlxText;
	var txtTapToStart:FlxText;

	var grpWeekText:FlxTypedGroup<SelectionItem>;

	var curSelection:Int = 0;
	
	public var curPc:Int;
	public var curVfx:Int;
	public var curSkin:Int;
	public var curControl:Int;
	public var curScroll:Int;
	public var curPlayMode:Int;


	public var grpPcs:FlxTypedGroup<PcItem>;
	public var grpVfxs:FlxTypedGroup<VfxItem>;
	public var grpSkins:FlxTypedGroup<SkinItem>;
	public var grpControls:FlxTypedGroup<ControlItem>;
	public var grpScrolls:FlxTypedGroup<ScrollItem>;
	public var grpPlayModes:FlxTypedGroup<PlayModeItem>;


	var grpLocks:FlxTypedGroup<FlxSprite>;
	
	var yellowBG:FlxSprite;

	var selectedPc:PcItem;
	var selectedVfx:VfxItem;
	var selectedSkin:SkinItem;
	var selectedControl:ControlItem;
	var selectedScroll:ScrollItem;
	var selectedPlayMode:PlayModeItem;


	public static var playModeData(get, never):Array<Int>;
	static inline function get_playModeData():Array<Int>
	{
		return FlxG.save.data.playModeData;
	} 


	public static var pcData(get, never):Array<Int>;
	static inline function get_pcData():Array<Int>
	{
		return FlxG.save.data.pcData;
	} 

	public static var skinData(get, never):Array<Int>;
	static inline function get_skinData():Array<Int>
	{
		return FlxG.save.data.skinData;
	} 

	public static var vfxData(get, never):Array<Int>;
	static inline function get_vfxData():Array<Int>
	{
		return FlxG.save.data.vfxData;
	} 

	override function create()
	{

		instance = this;

		// if (GameState.isStoryMode)
		{
			//cut some options yah
			// trace('story mode detected');
			options = ['Play', "Notes", "Effects", "Scrolls" , "Play Mode"];
		}

		AdMob.hideBanner();

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (FlxG.sound.music != null)
		{
			FlxG.sound.playMusic(Paths.music('charactertheme'));
		}

		persistentUpdate = persistentDraw = true;

		storeLabel = new FlxText(10, 10, 0, "CUSTOMIZATION", 36);
		storeLabel.setFormat("VCR OSD Mono", 32);

		storeLabel.screenCenter(X);
		

		//load datas babe

		curPc = FlxG.save.data.pcId;
		curVfx = FlxG.save.data.vfxId;
		curSkin  = FlxG.save.data.skinId;
		curControl = FlxG.save.data.mobileControl;
		curScroll = FlxG.save.data.scrollId;
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

		grpPcs = new FlxTypedGroup<PcItem>();
		grpVfxs = new FlxTypedGroup<VfxItem>();
		grpSkins = new FlxTypedGroup<SkinItem>();
		grpControls = new FlxTypedGroup<ControlItem>();
		grpScrolls = new FlxTypedGroup<ScrollItem>();
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
			// weekThing.updateHitbox();
		}

		for (i in 0...PcManager.pcList.length)
		{
			var weekThing:PcItem = new PcItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpPcs.add(weekThing);
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}

		// create play mode
		for (i in 0...PlayModeManager.playModeList.length)
		{
			var weekThing:PlayModeItem = new PlayModeItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpPlayModes.add(weekThing);
			weekThing.antialiasing = true;
		}
		
		// trace (grpPlayModes.length);


		// create skin
		for (i in 0...SkinManager.skinList.length)
		{
			var weekThing:SkinItem = new SkinItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpSkins.add(weekThing);
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}

		

		//create vfx
		for (i in 0...VfxManager.vfxList.length)
		{
			var weekThing:VfxItem = new VfxItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpVfxs.add(weekThing);
			weekThing.antialiasing = true;
		}
		

		// create controls
		for (i in 0...ControlManager.controlList.length)
		{
			var weekThing:ControlItem = new ControlItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpControls.add(weekThing);
			weekThing.antialiasing = true;

		}

		// create controls
		for (i in 0...ScrollManager.scrollList.length)
		{
			var weekThing:ScrollItem = new ScrollItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpScrolls.add(weekThing);
			weekThing.antialiasing = true;
		}

		


		selectedPc = new PcItem(curPc, 0, 0);
		selectedPc.y = yellowBG.y + 175;
		selectedPc.antialiasing = true;

		selectedSkin = new SkinItem(curSkin, yellowBG.x + yellowBG.width - 100, 0);
		selectedSkin.y = yellowBG.y + 175;
		selectedSkin.antialiasing = true;

		selectedVfx = new VfxItem(curVfx, yellowBG.x + yellowBG.width, 0);
		selectedVfx.y = yellowBG.y + 175;
		selectedVfx.antialiasing = true;


		selectedPc.deactiveTexts();
		selectedVfx.deactiveTexts();
		selectedSkin.deactiveTexts();

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

		add(grpPcs);
		add(grpVfxs);
		add(grpSkins);
		add(grpControls);
		add(grpScrolls);
		add(grpPlayModes);


		add(selectedPc);
		add(selectedSkin);
		add(selectedVfx);

		add(txtTapToStart);

		updateVfxReview();
		updatePcReview();	
		updateSkinReview();

		changeSelection(0);
		changeItem(0);

        AdMob.onInterstitialEvent = onRewarded;
		LoadingState.isAlertVisible = false;
		super.create();
		Controller.init(this, FULL, A_B, true);


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
				if (Controller.UP_P)
				{
					changeSelection(-1);
				}

				if (Controller.DOWN_P)
				{
					changeSelection(1);
				}


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
			if (GameState.isStoryMode)
			{
				FlxG.switchState(new StoryState());
			}
			else
			{
				FlxG.switchState(new FreePlayState());
			}
		}

		super.update(elapsed);
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;


	function select()
	{
		if (stopspamming)
			return;
		
		if (options[curSelection].toLowerCase() == 'play')
		{
			stopspamming = true;
			//go babe
			FlxG.sound.play(Paths.sound('confirmMenu'));
			// Controller._pad.visible = false;
			
			new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				LoadingState.createBlackFadeIn(this, function()
				{
					LoadingState.didLoadout = true;
					LoadingState.setStaticTransition();
					LoadingState.loadAndSwitchState(new GameState());
				});
			
				// LoadingState.createWeekLoadout(this, function()
				// {
				// });
			});
		}
		else
		{

			//todo add gacha state
			// stopspamming = true;
			// FlxG.sound.play(Paths.sound('confirmMenu'));
			// openSubState(new GachaState());
			// new FlxTimer().start(0.1, function(tmr:FlxTimer)
			// {
			// 	LoadingState.createBlackFadeIn(this, function()
			// 	{
			// 		LoadingState.didLoadout = true;
			// 		LoadingState.setStaticTransition();
			// 		LoadingState.loadAndSwitchState(new GachaState());
			// 	});
			// });
			// return;


			selectedItem = null;
			switch (options[curSelection].toLowerCase())
			{
				case 'characters':
					selectedItem = grpPcs.members[curPc];
				
				case 'notes':
					selectedItem = grpSkins.members[curSkin];

				case 'effects':
					selectedItem = grpVfxs.members[curVfx];

				case 'controls':
					selectedItem = grpControls.members[curControl];

				case 'scrolls':
					selectedItem = grpScrolls.members[curScroll];
						
				case 'play mode':
					selectedItem = grpPlayModes.members[curPlayMode];

			}

			if (selectedItem == null || selectedItem.isUnlocked)
			{
				// trace('selection: ' + selectedItem);
				// chamge it to play menu
				FlxG.sound.play(Paths.sound('scrollMenu'));
				curSelection = 0;
				changeSelection(0);

				if (selectedItem != null)
				{
					selectedItem.onSelected();
				}
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
		return options[curSelection].toLowerCase() == 'play';
	}

	private function isPc():Bool
	{
		return options[curSelection].toLowerCase() == 'characters';
	}

	private function isSkin():Bool
	{
		return options[curSelection].toLowerCase() == 'notes';
	}

	private function isVfx():Bool
	{
		return options[curSelection].toLowerCase() == 'effects';
	}

	private function isControl():Bool
	{
		return options[curSelection].toLowerCase() == 'controls';
	}

	private function isScroll():Bool
	{
		return options[curSelection].toLowerCase() == 'scrolls';
	}

	private function isPlayMode():Bool
	{
		return options[curSelection].toLowerCase() == 'play mode';
	}
	
		

//--------------------------------------------------------------------------------------------

	function updateRender()
	{
		grpPcs.visible = isPc();
		grpSkins.visible = isSkin();
		grpVfxs.visible = isVfx();
		grpControls.visible = isControl();
		grpScrolls.visible = isScroll();
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
		switch (options[curSelection].toLowerCase())
		{
			case 'play':
				updateOverview();
			
			case 'characters':
				changePc(change);
			
			case 'notes':
				changeSkin(change);
			
			case 'effects':
				changeVfx(change);

			case 'controls':
				changeControl(change);
			
			case 'scrolls':
				changeScroll(change);

			case 'play mode':
				changePlayMode(change);
		}


	}

	public function updatePcReview()
	{
		selectedPc.id = FlxG.save.data.pcId;
		selectedPc.updateUnlockStatus();
		selectedPc.createItemReview();
		updatePc();
	}

	public function updateSkinReview()
	{
		selectedSkin.id = FlxG.save.data.skinId;
		selectedSkin.updateUnlockStatus();
		selectedSkin.createItemReview(0.35);

		updateSkin();

	}
	
	public function updateVfxReview()
	{
		selectedVfx.id = FlxG.save.data.vfxId;
		selectedVfx.updateUnlockStatus();
		selectedVfx.createItemReview(0.35);
		updateVfx();

	}
	
	private function updateOverview()
	{

		updateRender();

		selectedPc.itemReview.visible = isOverview();
		selectedSkin.itemReview.visible = isOverview();
		selectedVfx.itemReview.visible = isOverview();


		txtTapToStart.visible = isOverview();

		// hardcoding, ah shit here we go again

		selectedSkin.itemReview.y = selectedPc.y - 200;

		selectedVfx.itemReview.x = selectedPc.x - 105;
		selectedVfx.itemReview.y = selectedPc.y - 400;

		txtTapToStart.x = selectedPc.x + 5;
		txtTapToStart.y = selectedPc.y + 140;

	}

	private function changePc(change:Int)
	{
		curPc += change;

		if (curPc < 0)
			curPc = PcManager.pcList.length - 1;
		if (curPc > PcManager.pcList.length - 1)
			curPc = 0;

		if(change != 0)
			FlxG.sound.play(Paths.sound('scrollMenu'));

		grpPcs.members[curPc].trySelect();

		updatePc();

	}


	private function changeScroll(change:Int)
	{
		curScroll += change;

		if (curScroll < 0)
			curScroll = ScrollManager.scrollList.length - 1;
		if (curScroll > ScrollManager.scrollList.length - 1)
			curScroll = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpScrolls.members[curScroll].trySelect();

		updateScroll();
	}

	private function changeControl(change:Int)
	{
		curControl += change;

		if (curControl < 0)
			curControl = ControlManager.controlList.length - 1;
		if (curControl > ControlManager.controlList.length - 1)
			curControl = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpControls.members[curControl].trySelect();

		updateControl();
	}

	private function changeSkin(change:Int)
	{
		curSkin += change;

		if (curSkin < 0)
			curSkin = SkinManager.skinList.length - 1;

		if (curSkin > SkinManager.skinList.length - 1)
			curSkin = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpSkins.members[curSkin].trySelect();

		updateSkin();
	}

	private function changeVfx(change:Int)
	{
		curVfx += change;

		if (curVfx < 0)
			curVfx = VfxManager.vfxList.length - 1;

		if (curVfx > VfxManager.vfxList.length - 1)
			curVfx = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpVfxs.members[curVfx].trySelect();

		updateVfx();
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
	

	private function updatePc()
	{
		var bullShit:Int = 0;

		for (item in grpPcs.members)
		{
			item.targetX = bullShit - curPc;
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

	private function updateSkin()
	{
		var bullShit:Int = 0;

		for (item in grpSkins.members)
		{
			item.targetX = bullShit - curSkin;
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

	public function updateVfx()
	{
		var bullShit:Int = 0;

		for (item in grpVfxs.members)
		{
			item.targetX = bullShit - curVfx;
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

	public function updateControl()
	{
		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetX = bullShit - curControl;
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

	public function updateScroll()
	{
		var bullShit:Int = 0;

		for (item in grpScrolls.members)
		{
			item.targetX = bullShit - curScroll;
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

	public function updatePlayMode()
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

