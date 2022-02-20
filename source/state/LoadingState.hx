package state; 

import state.*;
import selection.*;

import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

import flixel.addons.transition.FlxTransitionableState;
import fmf.songs.SongManager;
import flixel.FlxCamera;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import lime.app.Promise;
import lime.app.Future;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import haxe.io.Path;


//custom transition data
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxRect;
import flixel.math.FlxPoint;


class LoadingState extends MusicBeatState
{

	static public var didLoadout:Bool;


    inline static var MIN_TIME = 1.0;

    var target:FlxState;
    var stopMusic = false;
    var callbacks:MultiCallback;
    var danceLeft = false;
    public static var hasCachedSong:Bool;


    function new(target:FlxState, stopMusic:Bool)
    {
        super();
        this.target = target;
        this.stopMusic = stopMusic;
    }

    override function create()
    {
        initSongsManifest().onComplete(function(lib)
        {
            callbacks = new MultiCallback(onLoad);
            var introComplete = callbacks.add("introComplete");
			// trace('1');
            checkLoadSong(getSongPath());
            if (GameState.SONG.needsVoices)
                checkLoadSong(getVocalPath());
            checkLibrary("shared");

            //yeah shit
			if (GameState.playingSong != null)
			{
				checkLibrary("mods");
            }
			else
			{
                trace('no library to load babe');
            }
          

            var fadeTime = 0.5;
            FlxG.camera.fade(FlxG.camera.bgColor, fadeTime, true);
            new FlxTimer().start(fadeTime + MIN_TIME, function(_) introComplete());
        });
    }

    function checkLoadSong(path:String)
    {
        if (!Assets.cache.hasSound(path))
        {
            var library = Assets.getLibrary("songs");
            final symbolPath = path.split(":").pop();
            var callback = callbacks.add("song:" + path);
            //@notrace('try cache: ' + path);
            Assets.loadSound(path).onComplete(function(_)
            {
                trace('song load ok: ' + path);
                callback();
            });
        }
    }


    //load all required bitmap before going to play hahaha hohoho!
    function loadSongBitmap()
    {
        checkLoadBitmap(getBitmapPath('pc/' + PcManager.pcList[FlxG.save.data.pcId].name));
        checkLoadBitmap(getBitmapPath('bg/' + GameState.playingSong.folder));
        checkLoadBitmap(getBitmapPath('note_skins/' +  VfxManager.vfxList[FlxG.save.data.vfxId].name));
        checkLoadBitmap(getBitmapPath('note_effects/' + SkinManager.skinList[FlxG.save.data.skinId].name));
    
        //load dad, gf
        checkLoadBitmap(getBitmapPath('pc/' +  ''));
        checkLoadBitmap(getBitmapPath('gf_skins/' +  ''));

    }

    function checkLoadBitmap(path:String)
    {
        if (!Assets.cache.hasBitmapData(path))
        {
            //@notrace("load bitmap shit at path: " + path);
            var library = Assets.getLibrary("mods");
            final symbolPath = path.split(":").pop();
            var callback = callbacks.add("bg:" + path);
            Assets.loadBitmapData(path).onComplete(function(_)
            {
                callback();
            });
        }
    }


    function checkLibrary(library:String)
    {
        // trace('check lib: ' + library);
        if (Assets.getLibrary(library) == null)
        {
            @:privateAccess
            if (!LimeAssets.libraryPaths.exists(library))
                throw "Missing library: " + library;

            var callback = callbacks.add("library:" + library);
            Assets.loadLibrary(library).onComplete(function(_)
            {
                trace('library load ok: ' + library);
                callback();
            });
        }
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
        #if debug
        // if (FlxG.keys.justPressed.SPACE)
            //@notrace('fired: ' + callbacks.getFired() + " unfired:" + callbacks.getUnfired());
        #end
    }

    function onLoad()
    {
        if (stopMusic && FlxG.sound.music != null)
            FlxG.sound.music.stop();

        FlxG.switchState(target);
    }

    static function getSongPath()
    {
        var daSongPath = Paths.inst(GameState.SONG_NAME, GameState.playingSong.folder);
        //@notrace('songPath: ' + daSongPath);

        return daSongPath;
    }

    static function getVocalPath()
    {
        var daVocalPath =  Paths.voices(GameState.SONG_NAME, GameState.playingSong.folder);
        //@notrace('vocalPath: ' + daVocalPath);

        return daVocalPath;
    }

    static function getBitmapPath(path:String, library:String = 'mods')
    {
        return Paths.image(path, library);
    }

        

    inline static public function loadAndSwitchState(target:FlxState, stopMusic = false)
    {
        FlxG.switchState(getNextState(target, stopMusic));
    }

    public static function clearCachedSong()
    {
        if (!hasCachedSong)
        {
            //@notrace('no cached!');
            return;
        }

        var result:Bool = Assets.cache.removeSound(getSongPath());
        trace("remove song cached: " + getSongPath() + ", result: " + result);

        if (GameState.SONG.needsVoices)
        {
            var vocalResult:Bool = Assets.cache.removeSound(getVocalPath());
            trace("remove vocal cached: " + getVocalPath() + ", result: " + vocalResult);
        }
    }

    static function getNextState(target:FlxState, stopMusic = false):FlxState
    {
        Paths.setCurrentLevel(SongManager.songs[GameState.storyWeek].folder);
        // #if NO_PRELOAD_ALL
        //@notrace('need voices:' + GameState.SONG.needsVoices);
        var loaded = isSoundLoaded(getSongPath())
            && (!GameState.SONG.needsVoices || isSoundLoaded(getVocalPath()))
            && isLibraryLoaded("shared");

        if (!loaded)
            return new LoadingState(target, stopMusic);
        // #end
        if (stopMusic && FlxG.sound.music != null)
            FlxG.sound.music.stop();

        return target;
    }

    static function zoomInAndFading()
    {
        FlxG.camera.stopFX();

        new FlxTimer().start(0.016, function(tmr:FlxTimer)
        {
            // FlxG.camera.zoom += 0.016;
        }, 120);
    }

    public static function createBlackFadeIn(group:FlxGroup, callback:Void->Void, cam:FlxCamera = null, disposeOnCallback:Bool = false)
    {
        setDynamicTransition();
        var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);

        if (cam == null)
        {
            cam = new FlxCamera();
            FlxG.cameras.add(cam);
            cam.bgColor.alpha = 0;
        }

        blackScreen.cameras = [cam];
        blackScreen.alpha = 0;

        group.add(blackScreen);
        FlxTween.tween(blackScreen, {alpha: 1}, 0.5, {});

        new FlxTimer().start(1, function(tmr:FlxTimer)
        {
            // shit here
            callback();
            if (disposeOnCallback)
                group.remove(blackScreen);
        });
    }
	public static function createEmptyBlack(group:FlxGroup)
	{
		var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);
		
        blackScreen.scaleToFit();
        
        var shitCam = new FlxCamera();
		shitCam.bgColor.alpha = 0;
		FlxG.cameras.add(shitCam);

		blackScreen.cameras = [shitCam];
		group.add(blackScreen);
	}

	public static var isAlertVisible:Bool;
    
	public static function showAlert(group:FlxGroup, message:String, alertCam:FlxCamera = null, callback:Void->Void = null)
	{

		if (isAlertVisible)
			return;

        trace('show alert');
        isAlertVisible = true;
        var fuckshit:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);
        fuckshit.screenCenter();
        fuckshit.scaleToFit();


		var msgText = new FlxText(0, 10, 0, "", 32);
		msgText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, RIGHT);
        msgText.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		msgText.text = message;
        msgText.screenCenter();

		if (alertCam == null)
		{
			alertCam = new FlxCamera();
			alertCam.bgColor.alpha = 0;
			FlxG.cameras.add(alertCam);
		}

		fuckshit.cameras = [alertCam];
        msgText.cameras = [alertCam];
		fuckshit.alpha = 0;
		msgText.alpha = 0;


        group.add(fuckshit);
        group.add(msgText);

        FlxTween.tween(fuckshit, {alpha: 1}, 0.25, {});
		FlxTween.tween(msgText, {alpha: 1}, 0.25, {startDelay: 0.25});


		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.tween(fuckshit, {alpha: 0}, 0.5, {startDelay: 0.25});
			FlxTween.tween(msgText, {alpha: 0}, 0.5, {});
			// shit here
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
                isAlertVisible = false;
				group.remove(fuckshit);
				group.remove(msgText);

				if (callback != null)
					callback();
			});
		});

    }

	public static function showNewWeekUnlocked(group:FlxGroup, complete:Void->Void)
	{
		if (isAlertVisible)
			return;

        trace('show new week unlocked!');
        
        var weekUnlocked = GameState.storyWeek + 1;
        var daWeekData = SongManager.songs[weekUnlocked];


		isAlertVisible = true;
		var fuckshit:FlxSprite = new FlxSprite(0, 0);
		fuckshit.loadGraphic(Paths.image('freeplay/' + daWeekData.character));
		fuckshit.screenCenter();
		fuckshit.scaleToFit();

		var msgText = new FlxText(0, 10, 0, "", 32);
		msgText.setFormat("VCR OSD Mono", 32, FlxColor.YELLOW, RIGHT);
		msgText.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		msgText.text = "CONGRATULATION!!!";
		msgText.screenCenter();
        msgText.y -= 50;

		var unlockedText = new FlxText(0, 10, 0, "", 32);
		unlockedText.setFormat("VCR OSD Mono", 32, FlxColor.GREEN, RIGHT);
		unlockedText.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		unlockedText.text = "You unlocked a new week!";
		unlockedText.screenCenter();

		var newWeekText = new FlxText(0, 10, 0, "", 50);
		newWeekText.setFormat("VCR OSD Mono", 50, FlxColor.RED, RIGHT);
		newWeekText.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);
		newWeekText.text = daWeekData.songTitle.toUpperCase();
		newWeekText.screenCenter();
		newWeekText.y += 50;
        
	
		var alertCam = new FlxCamera();
		alertCam.bgColor.alpha = 0;
		FlxG.cameras.add(alertCam);

		fuckshit.cameras = [alertCam];
		msgText.cameras = [alertCam];
        unlockedText.cameras = [alertCam];
        newWeekText.cameras = [alertCam];

		fuckshit.alpha = 0;
		msgText.alpha = 0;
		unlockedText.alpha = 0;
        newWeekText.scale.x = 0;
        newWeekText.scale.y = 0;

		group.add(fuckshit);
		group.add(msgText);
		group.add(unlockedText);
        group.add(newWeekText);


		FlxTween.tween(fuckshit, {alpha: 1}, 0.25, {});
		FlxTween.tween(msgText, {alpha: 1}, 0.25, {startDelay: 0.25});
		FlxTween.tween(unlockedText, {alpha: 1}, 0.25, {startDelay: 0.25});
		FlxTween.tween(newWeekText, {"scale.x": 1}, 0.5, {ease: FlxEase.elasticInOut, startDelay: 0.4});
		FlxTween.tween(newWeekText, {"scale.y": 1}, 0.5, {ease: FlxEase.elasticInOut, startDelay: 0.4});

		new FlxTimer().start(4, function(tmr:FlxTimer)
		{
			FlxTween.tween(fuckshit, {alpha: 0}, 0.5, {startDelay: 0.25});
			FlxTween.tween(msgText, {alpha: 0}, 0.5, {});
            FlxTween.tween(unlockedText, {alpha: 0}, 0.5, {});
            FlxTween.tween(newWeekText, {alpha: 0}, 0.5, {});

            // shit here
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				isAlertVisible = false;
				group.remove(fuckshit);
				group.remove(msgText);
                group.remove(unlockedText);
				group.remove(newWeekText);
				if (complete != null)
				{
					complete();
                    StoryState.curWeek = weekUnlocked;
				}
			});
		});
	}

    public static function loadWeekSplash(group:FlxGroup, callback:Void->Void, cam:FlxCamera = null, disposeOnCallback:Bool = false)
    {
        if (FlxG.sound.music != null)
            FlxG.sound.music.stop();

        var daImages:Array<String> = ['loading/1', 'loading/2', 'loading/3'];
        var rand = FlxG.random.int(1, 7);

        var fuckshit:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);
        fuckshit.screenCenter();

        var blackScreen:FlxSprite = new FlxSprite(0, 0);
        blackScreen.loadGraphic(Paths.image("loading/" + rand));
        blackScreen.antialiasing = true;
        blackScreen.screenCenter();
        blackScreen.scaleToFit();
        
        var loading:FlxSprite = new FlxSprite(0, 0);
        loading.loadGraphic(Paths.image("loading/loading"));
        loading.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
        loading.screenCenter();
        loading.antialiasing = true;
        loading.alpha = 0;

        if (cam == null)
        {
            cam = new FlxCamera();
            FlxG.cameras.add(cam);
            cam.bgColor.alpha = 0;
        }

        blackScreen.cameras = [cam];
        loading.cameras = [cam];
        fuckshit.cameras = [cam];
        fuckshit.alpha = 1;
        blackScreen.alpha = 0;
        loading.alpha = 0;

        group.add(fuckshit);
        group.add(blackScreen);
        group.add(loading);


        FlxTween.tween(blackScreen, {alpha: 1}, 0.25, {});
        FlxTween.tween(loading, {alpha: 1}, 0.25, {});

		new FlxTimer().start(1, function (tmr:FlxTimer)
		{
            var targetA = loading.alpha >= 0.75 ? 0.25 : 1;
			FlxTween.tween(loading, {alpha: targetA}, 1, {});
		}, 50);

        new FlxTimer().start(1, function(tmr:FlxTimer)
        {
            // shit here
            new FlxTimer().start(2, function(tmr:FlxTimer)
            {
                callback();
                if (disposeOnCallback)
                {
                    group.remove(blackScreen);
                    group.remove(loading);
                    group.remove(fuckshit);
                }
            });
		});
	}

	public static function setStaticTransition()
	{
		var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
		diamond.persist = true;
		diamond.destroyOnNoUse = false;

		FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, 0), {asset: diamond, width: 32, height: 32},
			new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
		FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 0), {asset: diamond, width: 32, height: 32},
			new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

		FlxTransitionableState.skipNextTransIn = true;
		FlxTransitionableState.skipNextTransOut = true;
	}

	public static function setDynamicTransition()
	{
       
		var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
		diamond.persist = true;
		diamond.destroyOnNoUse = false;

		FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32},
			new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
		FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1), {asset: diamond, width: 32, height: 32},
			new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

		FlxTransitionableState.skipNextTransIn = false;
		FlxTransitionableState.skipNextTransOut = false;
	}

    public static function createWeekLoadout(group:FlxGroup, callback:Void->Void = null, cam:FlxCamera = null, disposeOnCallback:Bool = false)
    {

        if (FlxG.sound.music != null)
            FlxG.sound.music.stop();


        setStaticTransition();


        // var daImages:Array<String> = ['loading/1', 'loading/2'];
        // var rand = FlxG.random.int(1, 2);

        var daLoadout = "freeplay/" + GameState.playingSong.character;
        trace('loadout: ' + daLoadout);
        var blackScreen:FlxSprite = new FlxSprite(0, 0);
        blackScreen.loadGraphic(Paths.image(daLoadout));
        blackScreen.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
        blackScreen.antialiasing = true;
        blackScreen.screenCenter();

        var loading:FlxSprite = new FlxSprite(0, 0);
        loading.loadGraphic(Paths.image("loading/loading"));
        loading.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
        loading.screenCenter();
        loading.antialiasing = true;

        if (cam == null)
        {
            cam = new FlxCamera();
            FlxG.cameras.add(cam);
            cam.bgColor.alpha = 0;
        }

        blackScreen.cameras = [cam];
        loading.cameras = [cam];

        blackScreen.alpha = 0;
        loading.alpha = 0;

        group.add(blackScreen);
        group.add(loading);

        FlxTween.tween(blackScreen, {alpha: 1}, 0.25, {});
        FlxTween.tween(loading, {alpha: 1}, 0.25, {});

        new FlxTimer().start(0.5, function(tmr:FlxTimer)
        {
            // shit here
            new FlxTimer().start(0.5, function(tmr:FlxTimer)
            {
                if (callback != null)
                    callback();

                if (disposeOnCallback)
                {
                    group.remove(blackScreen);
                    group.remove(loading);
                }
            });
        });
    }

    public static function createBlackFadeOut(group:FlxGroup, cam:FlxCamera = null)
    {
        if (cam == null)
        {
            cam = FlxG.camera;
        }

        var blackShit:FlxSprite = new FlxSprite().makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
        blackShit.scrollFactor.set(0.5, 0.5);
        group.add(blackShit);

        blackShit.cameras = [cam];
        new FlxTimer().start(1, function(tmr:FlxTimer)
        {
            FlxTween.tween(blackShit, {alpha: 0}, 0.5, {
                ease: FlxEase.quartInOut,
                onComplete: function(callback:FlxTween)
                {
                    group.remove(blackShit);
                    blackShit = null;
                }
            });
        });
    }

    // #if NO_PRELOAD_ALL
    static function isSoundLoaded(path:String):Bool
    {
        var isSoundLoaded = Assets.cache.hasSound(path);
        //@notrace("is sound loaded????: " + isSoundLoaded);
        return isSoundLoaded;
    }

    static function isLibraryLoaded(library:String):Bool
    {
        return Assets.getLibrary(library) != null;
    }
    // #end

    override function destroy()
    {
        super.destroy();

        callbacks = null;
    }

    static function initSongsManifest()
    {
        var id = "songs";
        var promise = new Promise<AssetLibrary>();

        var library = LimeAssets.getLibrary(id);

        if (library != null)
        {
            return Future.withValue(library);
        }

        var path = id;
        var rootPath = null;

        @:privateAccess
        var libraryPaths = LimeAssets.libraryPaths;
        if (libraryPaths.exists(id))
        {
            path = libraryPaths[id];
            rootPath = Path.directory(path);
        }
        else
        {
            if (StringTools.endsWith(path, ".bundle"))
            {
                rootPath = path;
                path += "/library.json";
            }
            else
            {
                rootPath = Path.directory(path);
            }
            @:privateAccess
            path = LimeAssets.__cacheBreak(path);
        }

        AssetManifest.loadFromFile(path, rootPath).onComplete(function(manifest)
        {
            if (manifest == null)
            {
                promise.error("Cannot parse asset manifest for library \"" + id + "\"");
                return;
            }

            var library = AssetLibrary.fromManifest(manifest);

            if (library == null)
            {
                promise.error("Cannot open library \"" + id + "\"");
            }
            else
            {
                @:privateAccess
                LimeAssets.libraries.set(id, library);
                library.onChange.add(LimeAssets.onChange.dispatch);
                promise.completeWith(Future.withValue(library));
            }
        }).onError(function(_)
        {
                promise.error("There is no asset library with an ID of \"" + id + "\"");
        });

        return promise.future;
    }
}

class MultiCallback
{
    public var callback:Void->Void;
    public var logId:String = null;
    public var length(default, null) = 0;
    public var numRemaining(default, null) = 0;

    var unfired = new Map<String, Void->Void>();
    var fired = new Array<String>();

    public function new(callback:Void->Void, logId:String = null)
    {
        this.callback = callback;
        this.logId = logId;
    }

    public function add(id = "untitled")
    {
        id = '$length:$id';
        length++;
        numRemaining++;
        var func:Void->Void = null;
        func = function()
        {
            if (unfired.exists(id))
            {
                unfired.remove(id);
                fired.push(id);
                numRemaining--;

                if (logId != null)
                    log('fired $id, $numRemaining remaining');

                if (numRemaining == 0)
                {
                    if (logId != null)
                        log('all callbacks fired');
                    callback();
                }
            }
            else
                log('already fired $id');
        }
        unfired[id] = func;
        return func;
    }

    inline function log(msg):Void
    {
        if (logId != null)
            trace('$logId: $msg');
    }

    public function getFired()
        return fired.copy();

    public function getUnfired()
        return [for (id in unfired.keys()) id];
}
