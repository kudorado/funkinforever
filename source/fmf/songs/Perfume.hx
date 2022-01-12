 package fmf.songs;
import state.*;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Perfume extends Whitroll	
{
	private var characters_walking:FlxSprite;
	private var characters_walking2:FlxSprite;
	public var charswhohavewalked:Array<String> = [];
	public var charswhohavewalked2:Array<String> = [];
	var stopSTOPITSTOPITNOW:Int = 270;
	public var moveNOWWW:Bool = true;

	var chars:Array<String> = ["daliaayanna", "sarvruv", "koukapi","selsunday","macybob","tabifunsize","solnik","garcanchor","susyukichi","eddsworld","silly","jadssmokey","cvalkolsan","violetruria","bobbosip","jojo","dionnekaya"];
	var chars2:Array<String> = ["hexabigail","mikutricky", "nenedarnell" ,"pompomstatic","lnosans","unified","starlight","weedbud","natecre","kermojordo"];


	override function loadMap()
	{
		gamePlayState.defaultCamZoom = 1;
		
		var citycolor:FlxSprite = new FlxSprite( -125, -150.75);
		citycolor.loadGraphic(Paths.image("bg/date/citycolor", 'mods'));
		citycolor.scrollFactor.set(0,0.9);
		citycolor.active = false;
		
		
		var cityfarbg:FlxSprite = new FlxSprite(525, 132.3);
		cityfarbg.loadGraphic(Paths.image("bg/date/cityfarbg", 'mods'));
		cityfarbg.scrollFactor.set(0.2,0.4);
		cityfarbg.active = false;
		cityfarbg.antialiasing = true;
		
		
		var citybg:FlxSprite = new FlxSprite(0, -15);
		citybg.loadGraphic(Paths.image("bg/date/citybg", 'mods'));
		citybg.scrollFactor.set(0.4,0.4);
		citybg.active = false;
		citybg.antialiasing = true;
		
		
		characters_walking2 = new FlxSprite( 22.15, 150);
		characters_walking2.frames = Paths.getSparrowAtlas("bg/date/characters_walking2", 'mods');
		characters_walking2.scrollFactor.set(0.85,0.85);
		characters_walking2.active = true;
		characters_walking2.antialiasing = true;
		
		for(i in 0...chars2.length){
			characters_walking2.animation.addByIndices(chars2[i], "characters_walking_bg", [0+i*12, 1+i*12, 2+i*12, 3+i*12, 4+i*12, 5+i*12, 6+i*12, 7+i*12, 8+i*12, 9+i*12, 10+i*12, 11+i*12], "", 24, true);
		}
		
		characters_walking2.animation.play(chars2[FlxG.random.int(0,chars2.length-1)]);
		initBGChars();
		
		var blackshit:FlxSprite = new FlxSprite(0, -1174.35).makeGraphic(1280,400,FlxColor.BLACK);
		blackshit.active = false;
		blackshit.scrollFactor.set(0,1);
		
		var wallbg:FlxSprite = new FlxSprite(156, -685).loadGraphic(Paths.image("bg/date/wallbg", 'mods'));
		wallbg.active = false;
		wallbg.antialiasing = true;
		add(citycolor);
		add(cityfarbg);
		add(citybg);
		if(FlxG.save.data.distractions)add(characters_walking2);
		if(FlxG.save.data.distractions)add(characters_walking);

		var deco:FlxSprite = new FlxSprite(157, 0).loadGraphic(Paths.image('bg/date/deco', 'mods'));
		deco.antialiasing = true;
		deco.scale.y = 1;
		deco.scale.x = 1;
		gamePlayState.add(deco);
		
		createHeartThings();
		add(wallbg);
		
		createTable();


	
	
	}

	override function createLights()
	{
		var light:FlxSprite = new FlxSprite(450, -650).loadGraphic(Paths.image('bg/date/light', 'mods'));
		light.antialiasing = true;
		light.scale.y = 1;
		light.scale.x = 1;
		gamePlayState.add(light);
	}

	override function createCharacters()
	{
		super.createCharacters();
		createLights();

	}

	public function initBGChars()
	{
		characters_walking = new FlxSprite(820, 150);
		characters_walking.frames = Paths.getSparrowAtlas("bg/date/characters_walking", "mods");
		characters_walking.scrollFactor.set(0.9, 0.9);
		characters_walking.antialiasing = true;
		characters_walking.scale.x = 2;
		characters_walking.scale.y = 2;

		for (i in 0...chars.length)
		{
			//@notrace('add char shit:' + chars[i]);
			characters_walking.animation.addByIndices(chars[i], "Characters_walking0", [
				0 + i * 12, 1 + i * 12, 2 + i * 12, 3 + i * 12, 4 + i * 12, 5 + i * 12, 6 + i * 12, 7 + i * 12, 8 + i * 12, 9 + i * 12, 10 + i * 12,
				11 + i * 12
			], "", 24, true);
		}

		characters_walking.animation.addByIndices("dionnekaya", "Characters_walking0", [192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203], "", 24,
			true);

		characters_walking.animation.play(chars[FlxG.random.int(0, chars.length - 1)]);
	}


	override function update(elapsed:Float)
	{
		super.update(elapsed);

		ohNooooo();
	}

	function ohNooooo()
	{
		// heartbeat too
		if (FlxG.save.data.distractions
			&& characters_walking.animation != null
			&& characters_walking.animation.curAnim != null)
		{ // only on perfume. probably a better way to do this


			if (characters_walking.animation.curAnim.name == "selsunday" || characters_walking.animation.curAnim.name == "jojo")
			{

				if (moveNOWWW)
					characters_walking.x += 8;

				if (characters_walking.x > 1434.4)
				{
					if (characters_walking.animation.curAnim.name == characters_walking.animation.curAnim.name
						&& charswhohavewalked.contains(characters_walking.animation.curAnim.name))
					{ // if it's still the same character
						characters_walking.animation.play(chars[FlxG.random.int(0, chars.length - 1)]); // change the character (i should make this a function)
						if (gamePlayState.curBeat > stopSTOPITSTOPITNOW)
							moveNOWWW = false;
					}
					else
					{
						charswhohavewalked.push(characters_walking.animation.curAnim.name);
					}
				}
			}
			else if (chars.lastIndexOf(characters_walking.animation.curAnim.name) % 2 == 0)
			{

				if (moveNOWWW)
					characters_walking.x -= 2;

				if (characters_walking.x < -900)
				{
					if (characters_walking.animation.curAnim.name == characters_walking.animation.curAnim.name
						&& charswhohavewalked.contains(characters_walking.animation.curAnim.name))
					{ // if it's still the same character
						characters_walking.animation.play(chars[FlxG.random.int(0, chars.length - 1)]); // change the character
						if (gamePlayState.curBeat > stopSTOPITSTOPITNOW)
							moveNOWWW = false;
					}
					else
					{
						if (!charswhohavewalked.contains(characters_walking.animation.curAnim.name))
							charswhohavewalked.push(characters_walking.animation.curAnim.name);
					}
				}
			}
			else
			{

				if (moveNOWWW)
					characters_walking.x += 2;
				if (characters_walking.x > 1434.4)
				{
					if (characters_walking.animation.curAnim.name == characters_walking.animation.curAnim.name
						&& charswhohavewalked.contains(characters_walking.animation.curAnim.name))
					{ // if it's still the same character
						characters_walking.animation.play(chars[FlxG.random.int(0, chars.length - 1)]); // change the character (i should make this a function)
						if (gamePlayState.curBeat > stopSTOPITSTOPITNOW)
							moveNOWWW = false;
					}
					else
					{
						if (!charswhohavewalked.contains(characters_walking.animation.curAnim.name))
							charswhohavewalked.push(characters_walking.animation.curAnim.name);
					}
				}
			}

			if (true)
			{

				if (chars2.lastIndexOf(characters_walking2.animation.curAnim.name) % 2 == 0)
				{
					characters_walking2.x -= 2.1;
					if (characters_walking2.x < -1000
						&& characters_walking2.animation != null
						&& characters_walking2.animation.curAnim != null)
					{
						if (characters_walking2.animation.curAnim.name == characters_walking2.animation.curAnim.name
							&& charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))
						{ // if it's still the same character
							characters_walking2.animation.play(chars2[FlxG.random.int(0, chars2.length - 1)]); // change the character
						}
						else
						{
							if (!charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))
								charswhohavewalked2.push(characters_walking2.animation.curAnim.name);
						}
					}
				}
				else
				{
					characters_walking2.x += 2.1;
					if (characters_walking2.x > 1634.4
						&& characters_walking2.animation != null
						&& characters_walking2.animation.curAnim != null)
					{
						if (characters_walking2.animation.curAnim.name == characters_walking2.animation.curAnim.name
							&& charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))
						{ // if it's still the same character

							characters_walking2.animation.play(chars2[FlxG.random.int(0,
								chars2.length - 1)]); // change the character (i should make this a function)
						}
						else
						{
							if (!charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))
								charswhohavewalked2.push(characters_walking2.animation.curAnim.name);
						}
					}
				}
			}
		}

		if (charswhohavewalked.length >= chars.length)
			charswhohavewalked = [];
		if (charswhohavewalked2.length >= chars2.length) charswhohavewalked2 = [];

	}



}
