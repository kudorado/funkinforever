package;
import state.*;
import lime.app.Application;
import lime.system.DisplayMode;
import flixel.util.FlxColor;
import Controls.KeyboardScheme;
import flixel.FlxG;
import openfl.display.FPS;
import openfl.Lib;
import fmf.characters.*;
import fmf.songs.*;
import ui.CustomControlsState;



class OptionCategory
{
    private var _options:Array<Option> = new Array<Option>();
    public final function getOptions():Array<Option>
    {
        return _options;
    }

    public final function addOption(opt:Option)
    {
        _options.push(opt);
    }

    public final function setOptions(opt:Array<Option>)
    {
        _options = opt;
    }
    
    public final function removeOption(opt:Option)
    {
        _options.remove(opt);
    }

    private var _name:String = "New Category";
    public final function getName() {
        return _name;
    }

    public function new (catName:String, options:Array<Option>)
    {
        _name = catName;
        _options = options;
    }
}

class Option
{
    public function new()
    {
        display = updateDisplay();
    }
    private var description:String = "";
    private var display:String;
    private var acceptValues:Bool = false;
    public final function getDisplay():String
    {
        return display;
    }

    public final function getAccept():Bool
    {
        return acceptValues;
    }

    public final function getDescription():String
    {
        return description;
    }

    public function getValue():String { return throw "stub!"; };
    
    // Returns whether the label is to be updated.
    public function draw():Bool { return true; }
    public function press():Bool { return throw "stub!"; }
    private function updateDisplay():String { return throw "stub!"; }
    public function left():Bool { return throw "stub!"; }
    public function right():Bool { return throw "stub!"; }
}


class PcOption extends Option
{

    public function new(desc:String)
    {
        super();
        description = desc;
        acceptValues = true;
    }

	static public var pcList(get, never):Array<PcData>;
    static inline function get_pcList()
    {
        return PcManager.pcList;
    }

    
    public override function press():Bool
    {
        FlxG.save.data.pcId ++;

        if (FlxG.save.data.pcId < 0)
        {
            FlxG.save.data.pcId = pcList.length - 1;
        }
        if (FlxG.save.data.pcId > pcList.length - 1)
        {
            FlxG.save.data.pcId = 0;
        }

        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return getValue();
    }

    override function left():Bool {

        FlxG.save.data.pcId -= 2;
        OptionsMenu.instance.acceptPress();
        display = updateDisplay();

        return true;

    }
    override function right():Bool {

        OptionsMenu.instance.acceptPress();
        display = updateDisplay();


        return true;
    }

    override function getValue():String {
        return getPc;
    }

    private var getPc(get, never):String;
    private inline function get_getPc():String
    {
        return pcList[FlxG.save.data.pcId].name;
    }

}

class VFXOption extends Option
{

    public function new(desc:String)
    {
        super();
        description = desc;
        acceptValues = true;
    }

    static public var vfxList(get, never):Array<VfxData>;
    static inline function get_vfxList()
        {
            return VfxManager.vfxList;
        }
    
   
    
    public override function press():Bool
    {
        FlxG.save.data.vfxId += 1;

        if (FlxG.save.data.vfxId > vfxList.length - 1)
        {
            FlxG.save.data.vfxId = 0;
        }
        if (FlxG.save.data.vfxId < 0)
        {
            FlxG.save.data.vfxId = vfxList.length - 1;
        }
    
            
        display = updateDisplay();

        return true;
    }

    private override function updateDisplay():String
    {
        return getValue();
    }

    override function left():Bool {


        FlxG.save.data.vfxId -= 2;

        OptionsMenu.instance.acceptPress();
        display = updateDisplay();

        return true;

    }
    override function right():Bool {

        OptionsMenu.instance.acceptPress();
        display = updateDisplay();


        return true;
    }

    override function getValue():String {
        return getPc;
    }

    private var getPc(get, never):String;
    private inline function get_getPc():String
    {
        return vfxList[FlxG.save.data.vfxId].name;
    }

}





class SkinOption extends Option
{

    public function new(desc:String)
    {
        super();
        description = desc;
        acceptValues = true;
    }

    public static var skinList(get, never):Array<SkinData>;
	static inline function get_skinList():Array<SkinData>
	{
        return SkinManager.skinList;
    }
   
    public override function press():Bool
    {
        FlxG.save.data.skinId += 1;

        if (FlxG.save.data.skinId > skinList.length - 1)
        {
            FlxG.save.data.skinId = 0;
        }
        if (FlxG.save.data.skinId < 0)
        {
            FlxG.save.data.skinId = skinList.length - 1;
        }
            
        display = updateDisplay();

        return true;
    }

    private override function updateDisplay():String
    {
        return getValue();
    }

    override function left():Bool {

        FlxG.save.data.skinId -= 2;
        OptionsMenu.instance.acceptPress();
        display = updateDisplay();

        return true;

    }
    override function right():Bool {

        OptionsMenu.instance.acceptPress();
        display = updateDisplay();

        return true;
    }

    override function getValue():String {
        return getPc;
    }

    private var getPc(get, never):String;
    private inline function get_getPc():String
    {
        return skinList[FlxG.save.data.skinId].name;
    }

}



class MobileControl extends Option
{

    public function new(desc:String)
    {
        super();
        description = desc;
        acceptValues = true;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.mobileControl += 1;
        if (FlxG.save.data.mobileControl > 6)
        {
            FlxG.save.data.mobileControl = 0;
        }

        if (FlxG.save.data.mobileControl < 0)
        {
            FlxG.save.data.mobileControl = 6;
        }
            
        display = updateDisplay();

        return true;
    }

    private override function updateDisplay():String
    {
        return getValueControlType();
    }

    override function left():Bool {


        FlxG.save.data.mobileControl -= 2;

        OptionsMenu.instance.acceptPress();
        display = updateDisplay();

        return true;

    }
    override function right():Bool {

        OptionsMenu.instance.acceptPress();
        display = updateDisplay();

        return true;
    }
    function getValueControlType():String
    {
        return  controlTypeShort;
    }
    override function getValue():String {
        return "Type:  " + controlType;
    }

    private var controlType(get, never):String;
    private inline function get_controlType():String
    {
        var gamePad:String = "Gamepad Right";
        switch (FlxG.save.data.mobileControl)
        {
            case 1:
                gamePad = "Gamepad Left";

            case 2:
                gamePad = "Gamepad Full";

            case 3:
                gamePad = "Gamepad Split (Natural)";

            case 4:
                gamePad = "Gamepad Split (Flat)";
                    
            case 5:
                gamePad = "Hitbox";

            case 6:
                gamePad = "Custom";

        }

        return gamePad;
    }


    private var controlTypeShort(get, never):String;
    private inline function get_controlTypeShort():String
    {
        var gamePad:String = "Right";
        switch (FlxG.save.data.mobileControl)
        {
            case 1:
                gamePad = "Left";

            case 2:
                gamePad = "Full";

            case 3:
                gamePad = "Split-Natural";

            case 4:
                gamePad = "Split-Flat";
                    
            case 5:
                gamePad = "Hitbox";
            case 6: 
                gamePad = "Custom";
        }

        return gamePad;
    }
}


class CustomControlOption extends Option
{
    private var controls:Controls;

    public override function draw():Bool
    {
        return  FlxG.save.data.mobileControl == 6;
    }

    public function new(controls:Controls)
    {
        super();
        this.controls = controls;
    }

    public override function press():Bool
    {
        OptionsMenu.instance.lockState();
        LoadingState.createBlackFadeIn(OptionsMenu.instance, function()
        {
            FlxG.switchState(new CustomControlsState());
        });
        return true;
    }

    private override function updateDisplay():String
    {
        return "Settings";
    }
}


class DFJKOption extends Option
{
    private var controls:Controls;

    public function new(controls:Controls)
    {
        super();
        this.controls = controls;
    }

    public override function press():Bool
    {
        OptionsMenu.instance.openSubState(new KeyBindMenu());
        return false;
    }

    private override function updateDisplay():String
    {
        return "Key Bindings";
    }
}

class CpuStrums extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        FlxG.save.data.cpuStrums = !FlxG.save.data.cpuStrums;
        
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return  FlxG.save.data.cpuStrums ? "Light CPU Strums" : "CPU Strums stay static";
    }

}

class DownscrollOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return FlxG.save.data.downscroll ? "Downscroll" : "Upscroll";
    }
}

class GhostTapOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        FlxG.save.data.ghost = !FlxG.save.data.ghost;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return FlxG.save.data.ghost ? "Ghost Tapping" : "No Ghost Tapping";
    }
}

class AccuracyOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    public override function press():Bool
    {
        FlxG.save.data.accuracyDisplay = !FlxG.save.data.accuracyDisplay;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "Accuracy " + (!FlxG.save.data.accuracyDisplay ? "off" : "on");
    }
}

class SongPositionOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    public override function press():Bool
    {
        FlxG.save.data.songPosition = !FlxG.save.data.songPosition;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "Song Position " + (!FlxG.save.data.songPosition ? "off" : "on");
    }
}

class DistractionsAndEffectsOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    public override function press():Bool
    {
        FlxG.save.data.distractions = !FlxG.save.data.distractions;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "Distractions " + (!FlxG.save.data.distractions ? "off" : "on");
    }
}

class ResetButtonOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    public override function press():Bool
    {
        FlxG.save.data.resetButton = !FlxG.save.data.resetButton;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "Reset Button " + (!FlxG.save.data.resetButton ? "off" : "on");
    }
}

class FlashingLightsOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    public override function press():Bool
    {
        FlxG.save.data.flashing = !FlxG.save.data.flashing;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "Flashing Lights " + (!FlxG.save.data.flashing ? "off" : "on");
    }
}

class Judgement extends Option
{
    

    public function new(desc:String)
    {
        super();
        description = desc;
        acceptValues = true;
    }
    
    public override function press():Bool
    {
        return true;
    }

    private override function updateDisplay():String
    {
        return "Safe Frames";
    }

    override function left():Bool {

        if (Conductor.safeFrames == 1)
            return false;

        Conductor.safeFrames -= 1;
        FlxG.save.data.frames = Conductor.safeFrames;

        Conductor.recalculateTimings();
        return true;
    }

    override function getValue():String {
        return "Safe Frames: " + Conductor.safeFrames +
        " - SIK: " + HelperFunctions.truncateFloat(45 * Conductor.timeScale, 0) +
        "ms GD: " + HelperFunctions.truncateFloat(90 * Conductor.timeScale, 0) +
        "ms BD: " + HelperFunctions.truncateFloat(135 * Conductor.timeScale, 0) + 
        "ms SHT: " + HelperFunctions.truncateFloat(155 * Conductor.timeScale, 0) +
        "ms TOTAL: " + HelperFunctions.truncateFloat(Conductor.safeZoneOffset,0) + "ms";
    }

    override function right():Bool {

        if (Conductor.safeFrames == 20)
            return false;

        Conductor.safeFrames += 1;
        FlxG.save.data.frames = Conductor.safeFrames;

        Conductor.recalculateTimings();
        return true;
    }
}

class FPSOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        FlxG.save.data.fps = !FlxG.save.data.fps;
        (cast (Lib.current.getChildAt(0), Main)).toggleFPS(FlxG.save.data.fps);
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "FPS Counter " + (!FlxG.save.data.fps ? "off" : "on");
    }
}



class FPSCapOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
        acceptValues = true;
    }

    public override function press():Bool
    {
        return false;
    }

    private override function updateDisplay():String
    {
        return "FPS Cap";
    }
    
    override function right():Bool {
        if (FlxG.save.data.fpsCap >= 290)
        {
            FlxG.save.data.fpsCap = 290;
            (cast (Lib.current.getChildAt(0), Main)).setFPSCap(290);
        }
        else
            FlxG.save.data.fpsCap = FlxG.save.data.fpsCap + 10;
        (cast (Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);

        return true;
    }

    override function left():Bool {
        if (FlxG.save.data.fpsCap > 290)
            FlxG.save.data.fpsCap = 290;
        else if (FlxG.save.data.fpsCap < 60)
            FlxG.save.data.fpsCap = Application.current.window.displayMode.refreshRate;
        else
            FlxG.save.data.fpsCap = FlxG.save.data.fpsCap - 10;
        (cast (Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);
        return true;
    }

    override function getValue():String
    {
        return "Current FPS Cap: " + FlxG.save.data.fpsCap + 
        (FlxG.save.data.fpsCap == Application.current.window.displayMode.refreshRate ? "Hz (Refresh Rate)" : "");
    }
}


class ScrollSpeedOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
        acceptValues = true;
    }

    public override function press():Bool
    {
        return true;
    }

    private override function updateDisplay():String
    {
        return "Scroll Speed";
    }

    override function right():Bool {
        FlxG.save.data.scrollSpeed += 0.1;

        if (FlxG.save.data.scrollSpeed < 1)
            FlxG.save.data.scrollSpeed = 1;

        if (FlxG.save.data.scrollSpeed > 4)
            FlxG.save.data.scrollSpeed = 4;
        return true;
    }

    override function getValue():String {
        return "Current Scroll Speed: " + HelperFunctions.truncateFloat(FlxG.save.data.scrollSpeed,1);
    }

    override function left():Bool {
        FlxG.save.data.scrollSpeed -= 0.1;

        if (FlxG.save.data.scrollSpeed < 1)
            FlxG.save.data.scrollSpeed = 1;

        if (FlxG.save.data.scrollSpeed > 4)
            FlxG.save.data.scrollSpeed = 4;

        return true;
    }
}


class RainbowFPSOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        FlxG.save.data.fpsRain = !FlxG.save.data.fpsRain;
        (cast (Lib.current.getChildAt(0), Main)).changeFPSColor(FlxColor.WHITE);
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "FPS Rainbow " + (!FlxG.save.data.fpsRain ? "off" : "on");
    }
}

class NPSDisplayOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        FlxG.save.data.npsDisplay = !FlxG.save.data.npsDisplay;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "NPS Display " + (!FlxG.save.data.npsDisplay ? "off" : "on");
    }
}


class AccuracyDOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.accuracyMod = FlxG.save.data.accuracyMod == 1 ? 0 : 1;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "Accuracy Mode: " + (FlxG.save.data.accuracyMod == 0 ? "Accurate" : "Complex");
    }
}

class CustomizeGameplay extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        //KODURADO//@notrace("switch");
        FlxG.switchState(new GameplayCustomizeState());
        return false;
    }

    private override function updateDisplay():String
    {
        return "Customize Gameplay";
    }
}

class WatermarkOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        Main.watermarks = !Main.watermarks;
        FlxG.save.data.watermark = Main.watermarks;
        display = updateDisplay();
        return true;
    }

    private override function updateDisplay():String
    {
        return "Watermarks " + (Main.watermarks ? "on" : "off");
    }
}

class CustomizationOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
      
        LoadingState.loadAndSwitchState(new SelectionState());
        return true;
    }

    private override function updateDisplay():String
    {
        return "Customization";
    }
}

class PlaymodeOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
      
        LoadingState.loadAndSwitchState(new SelectionState());
        return true;
    }

    private override function updateDisplay():String
    {
        return "Play Mode";
    }
}



class OffsetMenu extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }

    public override function press():Bool
    {
        //KODURADO//@notrace("switch");
        var poop:String = Highscore.formatSong("Tutorial", 1);

        GamePlayState.SONG = Song.loadFromJson(poop, "Tutorial");
        GamePlayState.isStoryMode = false;
        GamePlayState.storyDifficulty = 0;
        GamePlayState.storyWeek = 0;
        GamePlayState.offsetTesting = true;
        //KODURADO//@notrace('CUR WEEK' + GamePlayState.storyWeek);
        LoadingState.loadAndSwitchState(new GamePlayState());
        return false;
    }

    private override function updateDisplay():String
    {
        return "Time your offset";
    }
}
class BotPlay extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.botplay = !FlxG.save.data.botplay;
        //KODURADO//@notrace('BotPlay : ' + FlxG.save.data.botplay);
        display = updateDisplay();
        return true;
    }
    
    private override function updateDisplay():String
        return "BotPlay " + (FlxG.save.data.botplay ? "on" : "off");
}

class GFGraphicOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.showGF = !FlxG.save.data.showGF;
        display = updateDisplay();
        return true;
    }
    
    private override function updateDisplay():String
        return "Girlfriend: " + (FlxG.save.data.showGF ? "on" : "off");
}


class BFGraphicOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.showBF = !FlxG.save.data.showBF;
        display = updateDisplay();
        return true;
    }
    
    private override function updateDisplay():String
        return "Boyfriend: " + (FlxG.save.data.showBF ? "on" : "off");
}


class DadGraphicOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.showDad = !FlxG.save.data.showDad;
        display = updateDisplay();
        return true;
    }
    
    private override function updateDisplay():String
        return "Dad: " + (FlxG.save.data.showDad ? "on" : "off");
}

class ArrowGraphicOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.showDadNote = !FlxG.save.data.showDadNote;
        display = updateDisplay();
        return true;
    }
    
    private override function updateDisplay():String
        return "Show Enemy Notes: " + (FlxG.save.data.showDadNote ? "on" : "off");
}

class ComboGraphicOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.showCombo = !FlxG.save.data.showCombo;
        display = updateDisplay();
        return true;
    }
    
    private override function updateDisplay():String
        return "Show Combo: " + (FlxG.save.data.showCombo ? "on" : "off");
}


class MapGraphicOption extends Option
{
    public function new(desc:String)
    {
        super();
        description = desc;
    }
    
    public override function press():Bool
    {
        FlxG.save.data.showMap = !FlxG.save.data.showMap;
        display = updateDisplay();
        return true;
    }
    
    private override function updateDisplay():String
        return "Load Map: " + (FlxG.save.data.showMap ? "on" : "off");
}

