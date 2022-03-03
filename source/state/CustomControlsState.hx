package state;

import reactor.*;
import ui.*;


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

class CustomControlsState extends MusicBeatState
{

	var _pad:FlxVirtualPad;
	// var _hb:Hitbox;

	var _saveconrtol:FlxSave;
	var exitbutton:FlxButton;
	var savebutton:FlxButton;

	var inputvari:FlxText;

	var controlitems:Array<String> = ['custom'];

	var curSelected:Int = 0;

	var buttonistouched:Bool = false;

	var bindbutton:flixel.ui.FlxButton;


	override function create()
	{

		AdMob.hideBanner();

		//save
		_saveconrtol = new FlxSave();
    	_saveconrtol.bind("saveconrtol");
		
		// bg
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic('assets/images/menuBG.png');
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.18;
		bg.updateHitbox();
		bg.screenCenter();
		bg.scaleToFit();
		bg.antialiasing = true;

		// load curSelected
		if (_saveconrtol.data.buttonsmode == null){
			curSelected = 0;
		}else{
			curSelected = _saveconrtol.data.buttonsmode[0];
		}
		

		//trace('oh shjt 102');
		//pad
		_pad = new FlxVirtualPad(LEFT_FULL, NONE);
		_pad.alpha = 0;
		


		//text inputvari
		inputvari = new FlxText(125, 50, 0,controlitems[0], 48);
		
		//arrows
		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');

		exitbutton = createButton(FlxG.width - 96 * 3, FlxG.height - 48 * 3, 44 * 3, 45 * 3, "b");//new FlxUIButton(FlxG.width - 650,25,"Back");
		savebutton = createButton(FlxG.width - 48 * 3, FlxG.height - 48 * 3, 44 * 3, 45 * 3, "a");

		//trace('oh shjt 162');
		// // add bg
		add(bg);

		// add buttons
		add(exitbutton);
		add(savebutton);

		// add virtualpad
		this.add(_pad);

		// change selection
		changeSelection();
		//trace('oh shjt 195');
		
		super.create();
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

		//trace('oh shjt 177');

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

		//trace('oh shjt 194');

		if (savebutton.justPressed || controls.ACCEPT)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));

			save();
			LoadingState.createBlackFadeIn(this, function()
			{
				FlxG.switchState(new SelectionState());
			});		
			
		}
		//trace('oh shjt 208');

		#if mobile
		for (touch in FlxG.touches.list){
	
			trackbutton(touch, touch);
		}
		#else
			trackbutton(FlxG.mouse, FlxG.mouse);
		#end
		//trace('oh shjt 228');

	
	}

	function changeSelection(change:Int = 0, ?forceChange:Int)
	{
		curSelected += change;

		//trace('228');
		if (forceChange != null)
		{
			curSelected = forceChange;
		}

		if (curSelected < 0)
			curSelected = controlitems.length - 1;
		if (curSelected >= controlitems.length)
			curSelected = 0;
		// KUDORADO//@no//trace(curSelected);

		inputvari.text = controlitems[curSelected];

		if (forceChange != null)
		{
			if (curSelected == 2)
			{
				_pad.visible = true;
			}

			return;
		}

		//trace('252');
		// _hb.visible = false;

		this.add(_pad);
		_pad.alpha = 0.855;
		loadcustom();

		//trace('260');

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
		//KUDORADO//@no//trace("saved");

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
		//trace('388');
		if (_saveconrtol.data.buttons != null)
		{
			//trace('load hb');
			var tempCount:Int = 0;

			for(buttons in _pad)
			{
				buttons.x = _saveconrtol.data.buttons[tempCount].x;
				buttons.y = _saveconrtol.data.buttons[tempCount].y;
				tempCount++;
			}
		}	

		//trace('402');

	
	}

	function resizebuttons(vpad:FlxVirtualPad, ?int:Int = 200) {
		for (button in vpad)
		{
				button.setGraphicSize(260);
				button.updateHitbox();
		}
	}

	function savetoclipboard(pad:FlxVirtualPad) {
		//KUDORADO//@no//trace("saved");
		
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

		//KUDORADO//@no//trace(json);

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
	}

	override function destroy()
	{
		super.destroy();
	}
}
