package ui;

import extension.admob.AdMob;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.graphics.frames.FlxAtlasFrames;
import flash.display.BitmapData;
import flixel.graphics.FlxGraphic;
import openfl.utils.ByteArray;

import flixel.input.IFlxInput;
import flixel.input.FlxPointer;
import flixel.system.FlxAssets.VirtualInputData;
import flixel.ui.FlxButton;
import lime.utils.Int16Array;
import lime.utils.Assets;
import flixel.addons.ui.FlxUIButton;
import flixel.text.FlxText;
import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import ui.FlxVirtualPad;
import flixel.util.FlxSave;
import flixel.math.FlxPoint;
import haxe.Json;
import ui.Hitbox;
#if lime
import lime.system.Clipboard;
#end

using StringTools;

class CustomControlsState extends MusicBeatSubstate
{

	var _pad:FlxVirtualPad;
	var _hb:Hitbox;

	var _saveconrtol:FlxSave;
	var exitbutton:FlxButton;
	var savebutton:FlxButton;

	var exportbutton:FlxUIButton;
	var importbutton:FlxUIButton;

	var up_text:FlxText;
	var down_text:FlxText;
	var left_text:FlxText;
	var right_text:FlxText;

	var inputvari:FlxText;

	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;
							//'hitbox',
	var controlitems:Array<String> = ['custom'];

	var curSelected:Int = 0;

	var buttonistouched:Bool = false;

	var bindbutton:flixel.ui.FlxButton;


	public function new()
	{

		AdMob.hideBanner();

		super();
		
		//save
		_saveconrtol = new FlxSave();
    	_saveconrtol.bind("saveconrtol");
		
		// bg
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic('assets/images/menuBG.png');
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;

		// load curSelected
		if (_saveconrtol.data.buttonsmode == null){
			curSelected = 0;
		}else{
			curSelected = _saveconrtol.data.buttonsmode[0];
		}
		

		//pad
		_pad = new FlxVirtualPad(RIGHT_FULL, NONE);
		_pad.alpha = 0;
		


		//text inputvari
		inputvari = new FlxText(125, 50, 0,controlitems[0], 48);
		
		//arrows
		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');

		leftArrow = new FlxSprite(inputvari.x - 60,inputvari.y - 10);
		leftArrow.frames = ui_tex;
		leftArrow.animation.addByPrefix('idle', "arrow left");
		leftArrow.animation.addByPrefix('press', "arrow push left");
		leftArrow.animation.play('idle');

		rightArrow = new FlxSprite(inputvari.x + inputvari.width + 10, leftArrow.y);
		rightArrow.frames = ui_tex;
		rightArrow.animation.addByPrefix('idle', 'arrow right');
		rightArrow.animation.addByPrefix('press', "arrow push right", 24, false);
		rightArrow.animation.play('idle');


		//text
		up_text = new FlxText(200, 200, 0,"Button up x:" + _pad.buttonUp.x +" y:" + _pad.buttonUp.y, 24);
		down_text = new FlxText(200, 250, 0,"Button down x:" + _pad.buttonDown.x +" y:" + _pad.buttonDown.y, 24);
		left_text = new FlxText(200, 300, 0,"Button left x:" + _pad.buttonLeft.x +" y:" + _pad.buttonLeft.y, 24);
		right_text = new FlxText(200, 350, 0,"Button right x:" + _pad.buttonRight.x +" y:" + _pad.buttonRight.y, 24);
		
		//hitboxes

		_hb = new Hitbox();
		_hb.visible = false;

		// buttons

				// actions.add();
		exitbutton = createButton(FlxG.width - 96 * 3, FlxG.height - 48 * 3, 44 * 3, 45 * 3, "b");//new FlxUIButton(FlxG.width - 650,25,"Back");
		// exitbutton.resize(125,50);
		// exitbutton.setLabelFormat("vcr.ttf",24,FlxColor.BLACK,"center");

		savebutton = createButton(FlxG.width - 48 * 3, FlxG.height - 48 * 3, 44 * 3, 45 * 3, "a");

		// new FlxUIButton((exitbutton.x + exitbutton.width + 25),25,"Save",() -> {
			// save();
			// FlxG.switchState(new OptionsMenu());
		// });
		// savebutton.resize(50,50);
		// savebutton.setLabelFormat("vcr.ttf",24,FlxColor.BLACK,"center");

		// exportbutton = new FlxUIButton(FlxG.width - 150, 25, "export", () -> { savetoclipboard(_pad); } );
		// exportbutton.resize(125,50);
		// exportbutton.setLabelFormat("vcr.ttf", 24, FlxColor.BLACK,"center");

		// importbutton = new FlxUIButton(exportbutton.x, 100, "import", () -> { loadfromclipboard(_pad); });
		// importbutton.resize(125,50);
		// importbutton.setLabelFormat("vcr.ttf", 24, FlxColor.BLACK,"center");

		// // add bg
		add(bg);

		// add buttons
		add(exitbutton);
		add(savebutton);
		add(exportbutton);
		add(importbutton);

		// add virtualpad
		this.add(_pad);

		//add hb
		add(_hb);



		// add arrows and text
		// add(inputvari);
		// add(leftArrow);
		// add(rightArrow);

		// add texts
		// add(up_text);
		// add(down_text);
		// add(left_text);
		// add(right_text);

		// change selection
		changeSelection();
	}

	public function createButton(X:Float, Y:Float, Width:Int, Height:Int, Graphic:String, ?OnClick:Void->Void):FlxButton
		{
			var button = new FlxButton(X, Y);
			var frame = getVirtualInputFrames().getByName(Graphic);
			button.frames = FlxTileFrames.fromFrame(frame, FlxPoint.get(Width, Height));
			button.resetSizeFromFrame();
			button.solid = false;
			button.immovable = true;
			button.scrollFactor.set();
			// button.updateHitbox();
	
			// #if FLX_DEBUG
			// button.ignoreDrawDebug = true;
			// #end
	
			if (OnClick != null)
				button.onDown.callback = OnClick;
	
			return button;
		}
	
		public static function getVirtualInputFrames():FlxAtlasFrames
		{
				#if !web
				var bitmapData = new GraphicVirtualInput(0, 0);
				#end
	
				/*
				#if html5 // dirty hack for openfl/openfl#682
				Reflect.setProperty(bitmapData, "width", 399);
				Reflect.setProperty(bitmapData, "height", 183);
				#end
				*/
				
				#if !web
				var graphic:FlxGraphic = FlxGraphic.fromBitmapData(bitmapData);
				return FlxAtlasFrames.fromSpriteSheetPacker(graphic, Std.string(new VirtualInputData()));
				#else
				var graphic:FlxGraphic = FlxGraphic.fromAssetKey(Paths.image('virtual-input'));
				return FlxAtlasFrames.fromSpriteSheetPacker(graphic, Std.string(new VirtualInputData()));
				#end
		}

	

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		#if android
		var androidback:Bool = FlxG.android.justReleased.BACK;
		#else
		var androidback:Bool = false;
		#end

		if (exitbutton.justPressed || androidback || controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			LoadingState.createBlackFadeIn(this, function()
			{
				FlxG.switchState(new SelectionState());
			});
		}

		if (savebutton.justPressed || controls.ACCEPT)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));

			save();
			LoadingState.createBlackFadeIn(this, function()
			{
				FlxG.switchState(new SelectionState());
			});		
			
		}
		
		#if mobile
		for (touch in FlxG.touches.list){
			//left arrow animation
			// arrowanimate(touch);
			
			// //change Selection
			// if(touch.overlaps(leftArrow) && touch.justPressed){
			// 	changeSelection(-1);
			// }else if (touch.overlaps(rightArrow) && touch.justPressed){
			// 	changeSelection(1);
			// }

			//custom pad 
			trackbutton(touch, touch);
		}
		#else
			trackbutton(FlxG.mouse, FlxG.mouse);
		#end

	
	}

	function changeSelection(change:Int = 0,?forceChange:Int)
		{
			curSelected += change;

			if (forceChange != null)
			{
				curSelected = forceChange;
			}

			if (curSelected < 0)
				curSelected = controlitems.length - 1;
			if (curSelected >= controlitems.length)
				curSelected = 0;
			//KUDORADOtrace(curSelected);
	
		
	
			inputvari.text = controlitems[curSelected];

			if (forceChange != null)
				{
					if (curSelected == 2){
						_pad.visible = true;
					}
					
					return;
				}
			
			_hb.visible = false;
	
			// switch curSelected{
				this.add(_pad);
				_pad.alpha = 0.855;
				loadcustom();
				// case 0:
				// 	this.remove(_pad);
				// 	_pad = null;
				// 	_pad = new FlxVirtualPad(RIGHT_FULL, NONE);
				// 	_pad.alpha = 0.855;
				// 	this.add(_pad);
				// case 1:
				// 	this.remove(_pad);
				// 	_pad = null;
				// 	_pad = new FlxVirtualPad(FULL, NONE);
				// 	_pad.alpha = 0.855;
				// 	this.add(_pad);
				// case 2:
				// 	//KUDORADOtrace(2);
				// 	_pad.alpha = 0;
				// case 3:
				// 	//KUDORADOtrace(3);
				// 	this.add(_pad);
				// 	_pad.alpha = 0.855;
				// 	loadcustom();
				// case 4:
				// 	remove(_pad);
				// 	_pad.alpha = 0;
				// 	_hb.visible = true;

			// }
	
		}

	function arrowanimate(touch:flixel.input.touch.FlxTouch){
		if(touch.overlaps(leftArrow) && touch.pressed){
			leftArrow.animation.play('press');
		}
		
		if(touch.overlaps(leftArrow) && touch.released){
			leftArrow.animation.play('idle');
		}
		//right arrow animation
		if(touch.overlaps(rightArrow) && touch.pressed){
			rightArrow.animation.play('press');
		}
		
		if(touch.overlaps(rightArrow) && touch.released){
			rightArrow.animation.play('idle');
		}
	}

	function trackbutton(touch:FlxPointer, input:IFlxInput){
		//custom pad

		if (buttonistouched){
			
			if (bindbutton.justReleased && input.justReleased)
			{
				bindbutton = null;
				buttonistouched = false;
			}else 
			{
				movebutton(touch, bindbutton);
				// setbuttontexts();
			}

		}else {
			if (_pad.buttonUp.justPressed) {
				movebutton(touch, _pad.buttonUp);
			}
			
			if (_pad.buttonDown.justPressed) {
				movebutton(touch, _pad.buttonDown);
			}

			if (_pad.buttonRight.justPressed) {
				movebutton(touch, _pad.buttonRight);

			}

			if (_pad.buttonLeft.justPressed) {
				movebutton(touch, _pad.buttonLeft);
			}
		}
	}

	function movebutton(touch:FlxPointer, button:flixel.ui.FlxButton) {
		button.x = touch.x - _pad.buttonUp.width / 2;
		button.y = touch.y - _pad.buttonUp.height / 2;
		bindbutton = button;
		buttonistouched = true;
	}

	function setbuttontexts() {
		up_text.text = "Button up x:" + _pad.buttonUp.x +" y:" + _pad.buttonUp.y;
		down_text.text = "Button down x:" + _pad.buttonDown.x +" y:" + _pad.buttonDown.y;
		left_text.text = "Button left x:" + _pad.buttonLeft.x +" y:" + _pad.buttonLeft.y;
		right_text.text = "Button right x:" + _pad.buttonRight.x +" y:" + _pad.buttonRight.y;
	}



	function save() {

		if (_saveconrtol.data.buttonsmode == null)
		{
			_saveconrtol.data.buttonsmode = new Array();

			_saveconrtol.data.buttonsmode.push(curSelected);
		}
		else
		{
			_saveconrtol.data.buttonsmode[0] = 0; //curSelected == 1 ? 3 : 3;
		}


		_saveconrtol.flush();
		savecustom();
	}

	function savecustom() {
		//KUDORADOtrace("saved");

		// Config.setdata(55);

		if (_saveconrtol.data.buttons == null)
		{
			_saveconrtol.data.buttons = new Array();

			for (buttons in _pad)
			{
				var point:FlxPoint = new FlxPoint(buttons.x, buttons.y);
				_saveconrtol.data.buttons.push(point);
			}
		}else
		{
			var tempCount:Int = 0;
			for (buttons in _pad)
			{
				var point:FlxPoint = new FlxPoint(buttons.x, buttons.y);

				_saveconrtol.data.buttons[tempCount] =  point; 
				tempCount++;
			}
		}
		
		_saveconrtol.flush();
	}

	function loadcustom():Void{
		//load pad
		if (_saveconrtol.data.buttons != null)
		{
			var tempCount:Int = 0;

			for(buttons in _pad)
			{
				buttons.x = _saveconrtol.data.buttons[tempCount].x;
				buttons.y = _saveconrtol.data.buttons[tempCount].y;
				tempCount++;
			}
		}	
	
	}

	function resizebuttons(vpad:FlxVirtualPad, ?int:Int = 200) {
		for (button in vpad)
		{
				button.setGraphicSize(260);
				button.updateHitbox();
		}
	}

	function savetoclipboard(pad:FlxVirtualPad) {
		//KUDORADOtrace("saved");
		
		var json = {
			buttonsarray : []
		};

		var tempCount:Int = 0;
		var buttonsarray = new Array();
		
		for (buttons in pad)
		{
			buttonsarray[tempCount] = FlxPoint.get(buttons.x, buttons.y);

			tempCount++;
		}

		json.buttonsarray = buttonsarray;

		//KUDORADOtrace(json);

		var data:String = Json.stringify(json);

		openfl.system.System.setClipboard(data.trim());
	}

	function loadfromclipboard(pad:FlxVirtualPad):Void{
		//load pad

		if (curSelected != 3)
			changeSelection(0,3);

		var cbtext:String = Clipboard.text; // this not working on android 10 or higher

		if (!cbtext.endsWith("}")) return;

		var json = Json.parse(cbtext);

		var tempCount:Int = 0;

		for(buttons in pad)
		{
			buttons.x = json.buttonsarray[tempCount].x;
			buttons.y = json.buttonsarray[tempCount].y;
			tempCount++;
		}	
		setbuttontexts();
	}

	override function destroy()
	{
		super.destroy();
	}
}
