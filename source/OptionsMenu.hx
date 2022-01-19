package;
import state.*;
import extension.admob.AdMob;
import fmf.skins.*;
import ui.Controller;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import openfl.Lib;
import Options;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

class OptionsMenu extends MusicBeatState
{
    public static var instance:OptionsMenu;

    var selector:FlxText;
    var curSelected:Int = 0;

    var options:Array<OptionCategory> = [
        new OptionCategory("", [
            new CustomizationOption("Customize your favorite characters, skins, effects..."),
            new PlaymodeOption("Select your play mode!"),
        ])
    ];



    public var acceptInput:Bool = true;

    private var currentDescription:String = "";
    private var grpControls:FlxTypedGroup<Alphabet>;
    public static var versionShit:FlxText;

    var currentSelectedCat:OptionCategory;
    var blackBorder:FlxSprite;
    override function create()
    {
        AdMob.hideBanner();

        instance = this;
        var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image("menuDesat"));

        menuBG.color = 0xFFea71fd;
        menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
        menuBG.updateHitbox();
        menuBG.screenCenter();
        menuBG.antialiasing = true;
        add(menuBG);

        grpControls = new FlxTypedGroup<Alphabet>();
        add(grpControls);

        for (i in 0...options.length)
        {
            var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false, true);
            controlLabel.isMenuItem = true;
            controlLabel.targetY = i;
            grpControls.add(controlLabel);
            // DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
        }

        currentDescription = "none";

        versionShit = new FlxText(5, 0, 0, "Offset (Left, Right, Shift for slow): " + HelperFunctions.truncateFloat(FlxG.save.data.offset,2) + " - Description - " + currentDescription, 12);
        versionShit.scrollFactor.set();
        versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        
        blackBorder = new FlxSprite(-30, 0).makeGraphic((Std.int(versionShit.width + 900)),Std.int(versionShit.height * 1.25),FlxColor.BLACK);
        blackBorder.alpha = 0.5;

        add(blackBorder);

        add(versionShit);

        // FlxTween.tween(versionShit,{y:  18},2,{ease: FlxEase.elasticInOut});
        // FlxTween.tween(blackBorder,{y: 18},2, {ease: FlxEase.elasticInOut});

        Controller.init(this, FULL, A_B);

        LibraryLoadState.createBlackFadeOut(this);

        super.create();
    }

    var isCat:Bool = false;
    

    public function backPress()
    {
        FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);

        if (!isCat)
            FlxG.switchState(new MenuState());
        else if (Controller.BACK)
        {
            isCat = false;
            grpControls.clear();
            for (i in 0...options.length)
                {
                    var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, options[i].getName(), true, false);
                    controlLabel.isMenuItem = true;
                    controlLabel.targetY = i;
                    grpControls.add(controlLabel);
                    // DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
                }
            curSelected = 0;
        }
    }




    function drawCategories()
    {
        var catOptions = currentSelectedCat.getOptions();

        var availableOptions = new Array<Option>();

        for (i in catOptions)
            if (i.draw())
                availableOptions.push(i);

        isCat = true;
        grpControls.clear();
        for (i in 0...availableOptions.length)
        {
            var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, availableOptions[i].getDisplay(), true, false);
            controlLabel.isMenuItem = true;
            controlLabel.targetY = i;
            grpControls.add(controlLabel);
            // DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
        }

    }

    var isLocked:Bool;
    public function lockState()
    {
        isLocked = true;
        
    }

    public function acceptPress()
    {
        FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);
        if (isCat)
        {
            if (currentSelectedCat.getOptions()[curSelected].press())
            {
                if (isLocked)
                    return;

                grpControls.remove(grpControls.members[curSelected]);
                var ctrl:Alphabet = new Alphabet(0, (70 * curSelected) + 30, currentSelectedCat.getOptions()[curSelected].getDisplay(), true, false);
                ctrl.isMenuItem = true;
                grpControls.add(ctrl);
            }

            if (currentSelectedCat.getName() == "Controls")
                drawCategories();
        }
        else
        {
            currentSelectedCat = options[curSelected];
            drawCategories();
            curSelected = 0;
        }
        
    }

    override function update(elapsed:Float)
    {
        if (isLocked)
            return;

        super.update(elapsed);

        if (acceptInput)
        {
            if (Controller.BACK)
                backPress();


            if (Controller.UP_P)
                changeSelection(-1);
            if (Controller.DOWN_P)
                changeSelection(1);
            
            if (isCat)
            {
                
                if (currentSelectedCat.getOptions()[curSelected].getAccept())
                {
                    if (Controller.SHIFT)
                    {
                        // if (Controller.RIGHT)
                        // {
                        //  currentSelectedCat.getOptions()[curSelected].right();
                        // }
                        // if (Controller.LEFT)
                        // {
                        //  currentSelectedCat.getOptions()[curSelected].left();
                        // }
                    }
                    else
                    {
                        if (Controller.RIGHT_P)
                        {
                            FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);
                            currentSelectedCat.getOptions()[curSelected].right();
                        }
                        if (Controller.LEFT_P)
                        {
                            currentSelectedCat.getOptions()[curSelected].left();
                            FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);
                        }
                    }

                }
                else
                {

                    if (Controller.SHIFT)
                    {
                        if (Controller.RIGHT_P)
                        {
                            FlxG.save.data.offset += 0.1;
                            FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);
                        }
                        else if (Controller.LEFT_P)
                        {
                            FlxG.save.data.offset -= 0.1;
                            FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);
                        }
                    }
                    else if (Controller.RIGHT){
                        // FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);
                        FlxG.save.data.offset += 0.1;

                    }
                    else if (Controller.LEFT)
                    {
                        // FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);
                        FlxG.save.data.offset -= 0.1;
                    }
                    
                
                }
                if (currentSelectedCat.getOptions()[curSelected].getAccept())
                    versionShit.text =  currentSelectedCat.getOptions()[curSelected].getValue() + " - Description - " + currentDescription;
                else
                    versionShit.text = "Offset (Left, Right, Shift for slow): " + HelperFunctions.truncateFloat(FlxG.save.data.offset,2) + " - Description - " + currentDescription;
            }
            else
            {
                if (Controller.SHIFT)
                    {
                        if (Controller.RIGHT_P)
                            FlxG.save.data.offset += 0.1;
                        else if (Controller.LEFT_P)
                            FlxG.save.data.offset -= 0.1;
                    }
                    else if (Controller.RIGHT)
                        FlxG.save.data.offset += 0.1;
                    else if (Controller.LEFT)
                        FlxG.save.data.offset -= 0.1;
            }
        

            // if (Controller.RESET)
                    // FlxG.save.data.offset = 0;
            if (Controller.ACCEPT)
                acceptPress();
        }
        FlxG.save.flush();
    }

    var isSettingControl:Bool = false;

    public function changeSelection(change:Int = 0)
    {
        #if !switch
        // //NGio.logEvent("Fresh");
        #end
        
        FlxG.sound.play(Paths.sound("scrollMenu"), 0.4);

        curSelected += change;

        if (curSelected < 0)
            curSelected = grpControls.length - 1;
        if (curSelected >= grpControls.length)
            curSelected = 0;

        if (isCat)
            currentDescription = currentSelectedCat.getOptions()[curSelected].getDescription();
        else
            currentDescription = "Please select a category";
        if (isCat)
        {
            if (currentSelectedCat.getOptions()[curSelected].getAccept())
                versionShit.text =  currentSelectedCat.getOptions()[curSelected].getValue() + " - Description - " + currentDescription;
            else
                versionShit.text = "Offset (Left, Right, Shift for slow): " + HelperFunctions.truncateFloat(FlxG.save.data.offset,2) + " - Description - " + currentDescription;
        }
        else
            versionShit.text = "Offset (Left, Right, Shift for slow): " + HelperFunctions.truncateFloat(FlxG.save.data.offset,2) + " - Description - " + currentDescription;
        // selector.y = (70 * curSelected) + 30;

        var bullShit:Int = 0;

        for (item in grpControls.members)
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
