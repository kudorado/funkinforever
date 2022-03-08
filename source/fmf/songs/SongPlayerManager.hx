package fmf.songs;

import MenuCharacter.CharacterSetting;
import reactor.*;
import ui.*;
import flixel.system.debug.Tooltip.TooltipOverlay;
import flixel.addons.ui.FlxMultiKey;
import state.*;
import flixel.addons.weapon.FlxWeapon.FlxTypedWeapon;
import Options.DownscrollOption;
import Options.PlaymodeOption;
import openfl.events.EventDispatcher;
import haxe.display.JsonModuleTypes.JsonClassFieldReference;
import flixel.input.gamepad.lists.FlxBaseGamepadList;
import openfl.display.GraphicsShader;
import lime.text.GlyphMetrics;
import flixel.system.scaleModes.RatioScaleMode;
import haxe.xml.Parser.XmlParserException;
import fmf.characters.Littleman;
import flixel.FlxG;

// this class will handle which SongPlayer should be play
class SongPlayerManager
{
	public static function getPcId():Int
	{
		var pcId:Int = FlxG.save.data.pcId;
		return pcId;
	}

	public static function getCurrentSong(songName:String):SongPlayer
	{
		var songPlayer:SongPlayer = new Tutorial('gf');

		switch (songName.toLowerCase())
		{
			case 'tutorial':
				songPlayer = new Tutorial('gf');

			case 'bopeebo' | 'fresh' | 'dadbattle' | 'dad battle' | 'dad-battle':
				songPlayer = new DaddyDearest("dad");

			case 'spookeez' | 'south':
				songPlayer = new Spookez("spooky");

			case 'monster':
				songPlayer = new Monster("monster");

			case 'pico' | 'philly' | 'blammed' | 'philly nice' | 'philly-nice' | 'phillynice':
				songPlayer = new Philly("pico");

			case 'satin-panties' | "high" | "milf" | 'satin panties' | 'satinpanties':
				songPlayer = new Mom("mom");

			case 'cocoa' | 'eggnog':
				songPlayer = new Parents("parents");

			case 'winter-horrorland' | 'winter horrorland' | 'winterhorrorland':
				songPlayer = new WinterHorrorland("monster-christmas");

			case 'senpai':
				songPlayer = new Senpai("school");

			case 'roses':
				songPlayer = new SenpaiAngry("school");

			case 'thorns':
				songPlayer = new SenpaiEvil("school");

			case 'light-it-up' | 'ruckus':
				songPlayer = new Matt("matt");

			case 'target-practice':
				songPlayer = new MattAngry();

			case 'lo-fight' | 'overhead':
				songPlayer = new Whitty('whitty');

			case 'ballistic':
				songPlayer = new Ballistic('ballistic');

			case 'remorse':
				songPlayer = new Remorse('remorse');

			case 'screenplay' | 'parasite' | 'guns':
				songPlayer = new Agoti("agoti");

			case 'agoti':
				songPlayer = new AgotiCrazy("agoti-crazy");

			case 'eeeaaaooo':
				songPlayer = new Eeeeaaaooo("tf");

			case 'target-practice[trueface]':
				songPlayer = new Practice("practice");

			case 'foolhardy[trueface]':
				songPlayer = new Fool("fool");

			case 'manifest[trueface]':
				songPlayer = new Trap('sky');

			case 'wife-forever':
				songPlayer = new Sky();

			case 'sky':
				songPlayer = new SkyTired();

			case 'sky-angry':
				songPlayer = new SkyAngry();

			case 'manifest':
				songPlayer = new SkyMad();

			case 'incident[trueface]':
				songPlayer = new Incident();

			case 'improbable-outset':
				songPlayer = new TrickyMask();

			case 'madness':
				songPlayer = new Tricky();

			case 'hellclown':
				songPlayer = new TrickyHell();

			case 'expurgation':
				songPlayer = new TrickyEx();

			case 'reality-bender':
				songPlayer = new TrickyBen();

			case 'wocky' | 'beathoven' | 'hairball':
				songPlayer = new Kapi();

			case 'nyaw':
				songPlayer = new KapiAngry();

			case 'flatzone':
				songPlayer = new KapiFan();

			case 'run[trueface]':
				songPlayer = new Stay();

			case 'headache':
				songPlayer = new Garcello();

			case 'nerves':
				songPlayer = new GarcelloTired();

			case 'release':
				songPlayer = new GarcelloDead();

			case 'fading':
				songPlayer = new GarcelloGhosty();

			case 'my-battle' | 'last-chance' | 'my battle' | 'last chance':
				songPlayer = new Tabi();

			case 'genocide':
				songPlayer = new TabiMad();

			case 'little-man':
				songPlayer = new BobSmall();

			case 'annie':
				songPlayer = new Annie();

			case 'uganda':
				songPlayer = new Uganda();

			case 'guraamelia':
				songPlayer = new GuraAmelia();

			case 'lila':
				return new Lila();

			case 'tom':
				return new Tom();

			case 'miku':
				return new Miku();

			case 'hdsenpaimad':
				return new HDSenpaiMad();

			case 'senpaighosty':
				return new SenpaiGhosty();

			case 'es-nerves':
				songPlayer = new EsGarcelloTired();

			case 'es-manifest':
				songPlayer = new EsManifest();

			case 'es-animal':
				songPlayer = new EsAnimal();

			case 'gf-mad':
				songPlayer = new GFMad();

			case 'nene':
				songPlayer = new Nene();

			case 'tord':
				songPlayer = new Tord();

			case 'drunkannie' | 'monster-christmas':
				songPlayer = new DrunkAnnie();

			case 'monika':
				songPlayer = new Monika();

			case 'sunday':
				songPlayer = new Sunday();

			case 'pompom':
				songPlayer = new Pompom();

			case 'roro':
				songPlayer = new Roro();

			case 'chara':
				songPlayer = new Chara();

			case 'liz':
				songPlayer = new Liz();

			case 'frisk':
				songPlayer = new Frisk();

			case 'carol':
				songPlayer = new Carol();

			case 'common sense' | 'common-sense':
				songPlayer = new Nonsense();

			case 'calm' | 'calm-down':
				songPlayer = new Tricky();

			case 'highlights':
				songPlayer = new NonsenseTired();

			case 'context':
				songPlayer = new NonsenseAngry();

			case 'nonsensemad':
				songPlayer = new NonsenseMad();

			case 'nonsense' | 'nonsensical':
				songPlayer = new NonsenseGod();

			case 'godrays':
				songPlayer = new Solazar();

			case 'popipo' | 'siu' | 'chug' | 'aishite':
				songPlayer = new Miku();

			case 'disappearance':
				songPlayer = new MikuMad();

			case 'sunshine':
				songPlayer = new Bob();

			case 'withered':
				songPlayer = new BobAngry();

			case 'run':
				songPlayer = new Run();

			case 'ron':
				songPlayer = new Ron();

			case 'trouble':
				songPlayer = new BobIsSuck();

			case 'onslaught':
				songPlayer = new BobIsBlack();

			case 'experimental-phase' | 'perfection':
				songPlayer = new Daidem();

			case 'dunk' | 'encore':
				songPlayer = new Dunk();

			case 'ram':
				songPlayer = new Ram();

			case 'hello-world':
				songPlayer = new HexHelloWorld();

			case 'glitcher':
				songPlayer = new Glitcher();

			case 'hex-virus':
				songPlayer = new Encore();

			case 'parish':
				songPlayer = new Parish();

			case 'worship':
				songPlayer = new Worship();

			case 'zavodila':
				songPlayer = new Ruv();

			case 'gospel':
				songPlayer = new Gospel();

			// case 'casanova':
			// 	songPlayer = new Selever();

			// case 'zavodila':
			// 	songPlayer = new Zavodila();

			// case 'gospel':
			// 	songPlayer = new Gospel();

			case 'casanova':
				songPlayer = new Casanova();

			case 'jump-in':
				songPlayer = new BabJumpIn();

			case 'swing':
				songPlayer = new BabSwing();

			case 'split':
				songPlayer = new BabSplit();

			case 'ronald mcdonald slide' | 'ronald-mcdonald-slide':
				songPlayer = new RonaldMcDonaldSlide();

			case 'jump-out':
				songPlayer = new BabJumpOut();

			case 'sussus-moogus':
				songPlayer = new SussusMoogus();

			case 'sabotage':
				songPlayer = new Sabotage();

			case 'meltdown':
				songPlayer = new Meltdown();

			case 'sussus-toogus':
				songPlayer = new SussusToogus();

			case 'lights-down':
				songPlayer = new LightsDown();

			case 'reactor':
				songPlayer = new Reactor();

			case 'ejected':
				songPlayer = new Ejected();

			case 'carefree':
				songPlayer = new Carefree();

			case 'careless':
				songPlayer = new Careless();

			case 'censory-overload':
				songPlayer = new CensoryOverload();

			case 'termination':
				songPlayer = new Termination();

			case 'cessation':
				songPlayer = new Cessation();

			case 'bushwhack':
				songPlayer = new Bushwhack();

			case 'foolhardy':
				songPlayer = new Foolhardy();

			case 'good-enough':
				songPlayer = new GoodEnough();

			case 'lover':
				songPlayer = new Lover();

			case 'tug-of-war':
				songPlayer = new TugOfWar();

			case 'animal':
				songPlayer = new Animal();

			case 'inverted-ascension':
				songPlayer = new InvertedAscension();

			case 'echoes':
				songPlayer = new Echoes();

			case 'artificial-lust':
				songPlayer = new ArtificialLust();

			case 'sadness':
				songPlayer = new Sadness();

			case 'rage':
				songPlayer = new Rage();

			case 'blueballsincident':
				songPlayer = new BlueballsIncident();

			case 'redemption':
				songPlayer = new Redemption();

			case 'first-town':
				songPlayer = new FirstTown();

			case 'liquated':
				songPlayer = new Liquated();

			case 'why-do-you-hate-me':
				songPlayer = new WhyDoYouHateMe();

			case 'ghost':
				songPlayer = new Ghost();

			case 'whitroll':
				songPlayer = new Whitroll();

			case 'playtime':
				trace('playtime');
				songPlayer = new PlayTime();

			case 'promenade':
				songPlayer = new Promenade();

			case 'dream-of-peace':
				songPlayer = new DreamOfPeace();

			case 'diagraphephobia':
				songPlayer = new Diagraphephobia();

			case 'post-mortal':
				songPlayer = new PostMortal();

			case 'plaything':
				songPlayer = new Plaything();

			case 'system-failure':
				songPlayer = new SystemFailure();

			case 'parasite[entity]':
				songPlayer = new Parasite();

			case 'godrays[entity]':
				songPlayer = new Godrays();

			case 'shotgun-shell':
				songPlayer = new ShotgunShell();

			case 'incident[bi]':
				songPlayer = new BlueballsIncident();

			case 'watch-out':
				songPlayer = new WatchOut();

			case 'apprehensive':
				songPlayer = new Apprehensive();

			case 'airship-blue':
				songPlayer = new AirshipBlue();

			case 'dlow':
				songPlayer = new Dlow();

			case 'double-trouble':
				songPlayer = new DoubleTrouble();

			case 'triple-trouble':
				songPlayer = new TripleTrouble();

			case 'double-kill':
				songPlayer = new TripleTrouble();

			case 'gray-impostor':
				songPlayer = new GrayImpostor();

			case 'blackout':
				songPlayer = new PurpleSpecimens();

			case 'purple-specimens':
				songPlayer = new PurpleSpecimens();

			case 'run-away':
				songPlayer = new RunAway();

			case 'perfume':
				songPlayer = new Perfume();

			case 'too-slow':
				songPlayer = new TooSlow();

			case 'heartbass':
				songPlayer = new Heartbass();

			case 'endless':
				songPlayer = new Endless();

			case 'you-cant-run':
				songPlayer = new YouCantRun();

			case 'triple-trouble[sonic]':
				songPlayer = new TripleTroubleSonic();

			case 'cycles':
				songPlayer = new Cycles();

			case 'sunshine[sonic]':
				songPlayer = new SunshineSonic();

			case 'chaos':
				songPlayer = new Chaos();

			case 'faker':
				songPlayer = new Faker();

			case 'black-sun':
				songPlayer = new BlackSun();

			case 'milk':
				songPlayer = new Milk();

			case 'too-fest':
				songPlayer = new TooFest();

			case 'chasing':
				songPlayer = new Chasing();

			case 'darkness':
				songPlayer = new Darkness();

			case 'sidekick':
				songPlayer = new Sidekick();

			case 'octane':
				songPlayer = new Octane();

			case 'accelerant':
				songPlayer = new Accelerant();

			case 'runtime':
				songPlayer = new RunTime();

			case 'corrupted-hero':
				songPlayer = new CorruptedHero();
			case 'brotherly-bond':
				songPlayer = new BrotherlyBond();
			case 'gummy-substance':
				songPlayer = new GummySubstance();
			case 'together-forever':
				songPlayer = new TogetherForever();

			case 'house' | 'insanity':
				songPlayer = new Dave();

			case 'polygonized':
				songPlayer = new Dave3D();

			case 'blocked' |  'corn-theft' | 'corntheft' | 'maze' | 'mealie':
				songPlayer = new Bambi();
				
			case 'splitathon':
				songPlayer = new Splitathon();

			case 'supernovae' |   'glitch' | 'vs-dave-thanksgiving':
				songPlayer = new BambiOld();

			case 'bonus-song':
				songPlayer = new DaveOld();

			case 'cheating':
				songPlayer = new Bambi3D();

			case 'unfairness':
				songPlayer = new Bambi3DRed();



			case 'disruption':
				
			//golden apple
			case 'applecore':
				songPlayer = new AppleCore();


			case 'high_school_conflict':
				songPlayer = new HighSchoolConflict();

			case 'rain_clouds' | 'my_confession':
				songPlayer = new RainClouds();

			case 'bara_no_yume':
				songPlayer = new BaraNoYume();

			case 'your_demise':
				songPlayer = new YourDemise();
			case 'sugar-rush' | 'sugar rush':
				return new SugarRush();

			case 'my_sweets':
				songPlayer = new MySweets();

			case 'baka':
				songPlayer = new Baka();
			
			case 'deep_breaths':
				songPlayer = new DeepBreaths(); 
			case 'obsession':
				songPlayer = new Obsession();

			case 'reconciliation':
				songPlayer = new Reconciliation();

			case 'edd':
				songPlayer = new Edd();

			case 'crucify_yuri_mix':
				songPlayer = new CrucifyYuriMix();

			case 'beathoven_natsuki_mix':
				songPlayer = new NatsukiMix();
			
			case 'its_complicated_sayori_mix':
				songPlayer = new SayoriMix();
			
			case 'glitcher_monika_mix':
				songPlayer = new MonikaMix();

			case 'poems_n_thorns':
				songPlayer = new BaraNoYume();
			
			case 'dual_demise':
				songPlayer = new DualDemise();

			case 'epiphany':
				songPlayer = new Epiphany();

			case 'erb':
				songPlayer = new Erb();
			case 'your_reality':
				songPlayer = new YourReality();

			case 'unloaded':
				songPlayer = new Unloaded();

			case 'wellwellwell':
				songPlayer = new WellWellWell();

			case 'tutorial[hd]':
				songPlayer = new TutorialHD();

			case 'parish-remix[hd]':
				songPlayer = new ParishHD();

			case 'worship[hd]':
				songPlayer = new WorshipHD();

			case 'zavodila-remix[hd]':
				songPlayer = new ZavodilaHD();

<<<<<<< HEAD
			case 'gospel-remix[hd]':
				songPlayer = new GospelHD();

=======
			case 'bopeebo[hd]':
				songPlayer = new BopeeboHD();

			case 'fresh[hd]':
				songPlayer = new FreshHD();

			case 'dad-battle[hd]':
				songPlayer = new DadBattleHD();
>>>>>>> 08cb35b443f8d0241c0b76527c0c170114822e4e

		}

		return songPlayer;
	}
}
