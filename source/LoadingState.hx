package;

import fmf.songs.SongData;
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

class LoadingState extends MusicBeatState
{
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
			checkLoadSong(getSongPath());
			loadSongBitmap();

			if (PlayState.SONG.needsVoices)
				checkLoadSong(getVocalPath());
			checkLibrary("shared");
			// if (PlayState.storyWeek > 0)
				// checkLibrary("mods");
			// else
				checkLibrary("tutorial");


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
			Assets.loadSound(path).onComplete(function(_)
			{
				callback();
			});
		}
	}


	//load all required bitmap before going to play hahaha hohoho!
	function loadSongBitmap()
	{
		trace("check load bitmap!");
		var pc:String = PcManager.pcList[FlxG.save.data.pcId].name;
		var vfx:String = VfxManager.vfxList[FlxG.save.data.vfxId].name;
		var skin:String = SkinManager.skinList[FlxG.save.data.skinId].name;

		checkLoadBitmap(getBitmapPath('pc/' + pc + "/" + pc));
		checkLoadBitmap(getBitmapPath('pc/' + pc + '/' + pc + '_miss'));

        checkLoadBitmap(getBitmapPath('note_skins/' + vfx + "/" + vfx)) ;
        checkLoadBitmap(getBitmapPath('note_effects/' + skin  + '/' + skin));
    
        //load dad, gf, bg

        var song:SongData = PlayState.playingSong;
        var index:Int = song.songIndex;

        if (song.bitmapList.length > index)
        {
            //load all bg
            for(bg in song.bitmapList[index].bg)
            {
                checkLoadBitmap(getBitmapPath(bg));
            }

            //load all pc
            for (pc in song.bitmapList[index].pc)
            {
                checkLoadBitmap(getBitmapPath(pc));
            }

        
            // load all gf
            for (gf in song.bitmapList[index].gf)
            {
                checkLoadBitmap(getBitmapPath(gf));
            }

        }
        else
        {
            trace('no bitmap to load for ' + PlayState.CURRENT_SONG);
        }

	}

	function checkLoadBitmap(path:String)
	{
		if (!Assets.cache.hasBitmapData(path))
		{
			trace("load bitmap shit at path: " + path);
			var library = Assets.getLibrary("mods");
			final symbolPath = path.split(":").pop();
			// var callback = callbacks.add("load shit:" + path);
			Assets.loadBitmapData(path).onComplete(function(_)
			{
				// callback();
			});
		}
	}


	function checkLibrary(library:String)
	{
		trace("check library: " + library + ", result: " +  Assets.hasLibrary(library));
		if (library == 'mods')
		{
			//don't load this lib
			trace("catched mods library, ignore!");
		}
		else if (Assets.getLibrary(library) == null)
		{
			@:privateAccess
			if (!LimeAssets.libraryPaths.exists(library))
				throw "Missing library: " + library;

			var callback = callbacks.add("library:" + library);
			Assets.loadLibrary(library).onComplete(function(_)
			{
				callback();
			});
		}

	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		#if debug
		if (FlxG.keys.justPressed.SPACE)
			trace('fired: ' + callbacks.getFired() + " unfired:" + callbacks.getUnfired());
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
		return Paths.inst(PlayState.SONG.song, PlayState.playingSong.folder);
	}

	static function getVocalPath()
	{
		return Paths.voices(PlayState.SONG.song, PlayState.playingSong.folder);
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
			trace('no cached!');
			return;
		}

		var result:Bool = Assets.cache.removeSound(getSongPath());
		trace("remove song cached: " + getSongPath() + ", result: " + result);


		if (PlayState.SONG.needsVoices)
		{
			var vocalResult:Bool = Assets.cache.removeSound(getVocalPath());
			trace("remove vocal cached: " + getVocalPath() + ", result: " + vocalResult);
		}
	}

	static function getNextState(target:FlxState, stopMusic = false):FlxState
	{
		Paths.setCurrentLevel(SongManager.songs[PlayState.storyWeek].folder);
		// #if NO_PRELOAD_ALL
		var loaded = isSoundLoaded(getSongPath())
			&& (!PlayState.SONG.needsVoices || isSoundLoaded(getVocalPath()))
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
		var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.BLACK);

		if (cam == null)
			cam = FlxG.camera;

		blackScreen.cameras = [cam];
		blackScreen.alpha = 0;

		group.add(blackScreen);
		FlxTween.tween(blackScreen, {alpha: 1}, {});

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			// shit here
			callback();
			if (disposeOnCallback)
				group.remove(blackScreen);
		});
	}

	public static function createBlackFadeOut(group:FlxGroup, cam:FlxCamera = null)
	{
		if (cam == null)
			cam = FlxG.camera;

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
		trace("loaded sound path: " + path);
		return Assets.cache.hasSound(path);
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