package ui;

import flixel.graphics.FlxGraphic;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.ui.FlxVirtualPad;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

// copyed from flxvirtualpad
class Hitbox extends FlxSpriteGroup
{
    public var hitbox:FlxSpriteGroup;
    public var hitboxHint:FlxSpriteGroup;

    var sizex:Int = 320;

    var screensizey:Int = 720;

    public var left:FlxButton;
    public var down:FlxButton;
    public var up:FlxButton;
    public var right:FlxButton;
	var sp:Float = 0.15;
    var tp:Float = 0.9;

    var daPress:Float = 0.075;
    var daRelease:Float = 0.1;
    var daOut:Float = 0.2;

    public function new(?widghtScreen:Int, ?heightScreen:Int)
    {
        super(widghtScreen, heightScreen);

        sizex = widghtScreen != null ? Std.int(widghtScreen / 4) : 320;

        
        //add graphic
        hitbox = new FlxSpriteGroup();
        hitboxHint = new FlxSpriteGroup();

        hitbox.scrollFactor.set();
        hitboxHint.scrollFactor.set();


        hitboxHint.add(add(createhitboxHint(0, "left")));

        hitboxHint.add(add(createhitboxHint(1, "down")));

        hitboxHint.add(add(createhitboxHint(2, "up")));

        hitboxHint.add(add(createhitboxHint(3, "right")));


        
        hitbox.add(add(left = createhitbox(0, "left")));

        hitbox.add(add(down = createhitbox(1, "down")));

        hitbox.add(add(up = createhitbox(2, "up")));

        hitbox.add(add(right = createhitbox(3, "right")));


        

    }


    public function createhitbox(X:Float, framestring:String) {
        var button = new FlxButton(X, 0);
        var frames = Paths.getSparrowAtlas('hitbox');// FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox.png', 'assets/shared/images/hitbox/hitbox.xml');
        
        var maxWidth:Float = FlxG.width / 4;

        button.loadGraphic(FlxGraphic.fromFrame(frames.getByName(framestring)));
        button.setGraphicSize(Std.int(Math.min(button.width, maxWidth)), FlxG.height);
        button.updateHitbox();
        button.screenCenter(Y);

        button.alpha = sp;
        var quater = (FlxG.width  / 4) / 2;

        switch (X){
            case 0:
                button.x = 0;
            case 1:
                button.x = button.width;
            case 2:
                button.x = FlxG.width  - (button.width * 2);
            case 3:
                button.x = FlxG.width  - (button.width);

        }
    
        button.onDown.callback = function (){
            FlxTween.num(sp, tp, daPress, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        };

        button.onUp.callback = function (){
            FlxTween.num(tp, sp, daRelease, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }
        
        button.onOut.callback = function (){
            FlxTween.num(button.alpha, sp, daOut, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }

        return button;
    }



    public function createhitboxHint(X:Float, framestring:String) {
        var spr = new FlxSprite(X, 0);
        var frames = Paths.getSparrowAtlas('hitbox_hint');// FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox.png', 'assets/shared/images/hitbox/hitbox.xml');
        
        var maxWidth:Float = FlxG.width / 4;

        spr.loadGraphic(FlxGraphic.fromFrame(frames.getByName(framestring)));
        spr.setGraphicSize(Std.int(Math.min(spr.width, maxWidth)), FlxG.height);
        spr.updateHitbox();
        spr.screenCenter(Y);
        spr.alpha = 0.3;
        switch (X){
            case 0:
                spr.x = 0;
            case 1:
                spr.x = spr.width;
            case 2:
                spr.x = FlxG.width  - (spr.width * 2);
            case 3:
                spr.x = FlxG.width  - (spr.width);

        }

        return spr;
    }

    override public function destroy():Void
        {
            super.destroy();
    
            left = null;
            down = null;
            up = null;
            right = null;
        }
}