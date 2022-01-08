 package fmf.songs;

import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Heartbass extends Perfume	
{

	var sky_heartbass:FlxSprite;
	var farris_wheel:FlxSprite;
	var farris_seat:FlxSpriteGroup;
	var plane:FlxSprite;
	var backboppers:FlxSprite;
	var frontboppers:FlxSprite;
	var updictionary:FlxSprite = new FlxSprite(1380, 250);
	
	var dancing:Bool;
	var bfy:Float;
	var gfy:Float;

	var eventSong:HeartbassEvent;
	
	override function loadMap()
	{
		playState.defaultCamZoom = 1.2;
		updictionary.frames = Paths.getSparrowAtlas("bg/date/updicksucker", 'mods');
		updictionary.animation.addByPrefix("updiploma", "updimitri", 24, false);
		updictionary.scrollFactor.set(0.8, 0.8);
		updictionary.antialiasing = true;
		sky_heartbass = new FlxSprite(100,-50);
		sky_heartbass.frames = Paths.getSparrowAtlas("bg/date/sky_heartbass", 'mods');
		sky_heartbass.animation.addByPrefix("boom", "sky_heartbass", 24, false );
		sky_heartbass.animation.play("boom");
		sky_heartbass.antialiasing = true;
		sky_heartbass.scrollFactor.set(0.1,0.1);
		
		var bg_hb:FlxSprite = new FlxSprite(-185.5,220);
		bg_hb.loadGraphic(Paths.image("bg/date/bg_hb", 'mods'));
		bg_hb.scrollFactor.set(0.2, 0.2);
		bg_hb.active = false;
		bg_hb.antialiasing = true;
		
		plane = new FlxSprite(1600,96.3);
		plane.loadGraphic(Paths.image("bg/date/plane", 'mods'));
		plane.scrollFactor.set(0.2, 0.2);
		plane.active = false;
		plane.antialiasing = true;
		
		var midg:FlxSprite = new FlxSprite(157, 115);
		midg.loadGraphic(Paths.image("bg/date/midg", 'mods'));
		midg.scrollFactor.set(0.5,0.5);
		midg.active = false;
		midg.antialiasing = true;
		
		farris_wheel = new FlxSprite(106.75,-66.4);
		farris_wheel.frames = Paths.getSparrowAtlas("bg/date/farris_wheel", 'mods');
		farris_wheel.animation.addByIndices("thing1", "farris_wheel",[0],"", 0, false );
		farris_wheel.animation.addByIndices("thing2", "farris_wheel",[1],"", 0, false );
		farris_wheel.animation.addByIndices("thing3", "farris_wheel",[2],"", 0, false );
		farris_wheel.animation.addByIndices("thing4", "farris_wheel",[3],"", 0, false );
		farris_wheel.animation.play("thing1");
		farris_wheel.antialiasing = true;
		farris_wheel.scrollFactor.set(0.6, 0.6);


		farris_seat = new FlxSpriteGroup(0, 0);
		farris_seat.scrollFactor.set(0.6, 0.6);
		
		for (i in 0...24){
			var fs = new FlxSprite(325.85,371.1);
			fs.loadGraphic(Paths.image("bg/date/farris_seat", 'mods'));
			fs.active = false;
			fs.antialiasing = true;
			farris_seat.add(fs);
		}
		var fair_gate:FlxSprite = new FlxSprite(0, -369);
		fair_gate.loadGraphic(Paths.image("bg/date/fair_gate", 'mods'));
		fair_gate.scrollFactor.set(0.95, 0.95);
		fair_gate.antialiasing = true;
		
		var chairs:FlxSprite = new FlxSprite(625, 429);
		
		chairs.loadGraphic(Paths.image("bg/date/chairs", 'mods'));
		chairs.antialiasing = true;
		
		backboppers = new FlxSprite(175, -169.45);
		backboppers.loadGraphic(Paths.image("bg/date/backboppers", 'mods'));
		backboppers.scrollFactor.set(0.9, 0.9);
		backboppers.antialiasing = true;
		
		frontboppers = new FlxSprite(175, -59.55);
		frontboppers.loadGraphic(Paths.image("bg/date/frontboppers", 'mods'));
		frontboppers.scrollFactor.set(0.93, 0.93);
		frontboppers.antialiasing = true;
		
		
		initBGChars();
		
		add(sky_heartbass);
		add(bg_hb);
		add(midg);
		add(plane);
		add(farris_wheel);
		add(farris_seat);
		add(updictionary);
		
		if(FlxG.save.data.distractions)add(characters_walking);
		
		add(backboppers);
		add(frontboppers);

		createHeartThings();
		add(fair_gate);
		add(chairs);
		createTable();
		
		backboppers.y = frontboppers.y = 900;
		backboppers.visible = false;

		//what the fuck is this shjt
		frontboppers.y = frontboppers.y = 900;
		frontboppers.visible = false;

		eventSong = new HeartbassEvent();
		eventSong.createDad();

	}

	override function createCharacters()
	{
		super.createCharacters();

		eventEnter();

		//cache it babe
		new FlxTimer().start(0.1, function shit(tmr:FlxTimer)
		{
			eventExit();
		}, 1);

	}

	function eventEnter()
	{
		switchDad(eventSong, false);
		
		dad.x = 400;
		dad.y = 150;
	
	}

	function eventExit()
	{
		switchDad(new Heartbass(), true, false);
	}

	override function ohNooooo()
	{
		//vi ta chua tung dam sau nâu nâu nấu nầu
		//fuck you.
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();

		if(dancing)
			playState.targetCamFollow.y = bf.getMidpoint().y - 200;

	}

	override function updateCamFollowBF()
	{
		super.updateCamFollowBF();

		if(dancing)
			playState.targetCamFollow.y = bf.getMidpoint().y - 200;

	}

	override function midSongEventUpdate(curBeat:Int)
	{
		if (FlxG.save.data.distractions)
			sky_heartbass.animation.play("boom", true);
		if (FlxG.save.data.distractions)
			farris_wheel.animation.play("thing" + FlxG.random.int(1, 4));
	
		if (curBeat == 302)//302)
		{
			if (FlxG.save.data.distractions)
			{
				updictionary.x = 1400;
				updictionary.animation.play("updiploma");
				FlxTween.tween(updictionary, {x: 120}, 12);

				FlxTween.tween(playState, {defaultCamZoom:1}, 6);
			}
		}
		
		if (dancing && curBeat >= 9 && curBeat < 437 && FlxG.save.data.distractions)
		{
			playState.camGame.zoom += 0.05;
		}
		
		if (curBeat == 359)
		{
			frontboppers.visible = true;
			backboppers.visible = true;
			if (FlxG.save.data.distractions)
				playState.defaultCamZoom += 0.2;
			if (FlxG.save.data.distractions)
				FlxTween.tween(backboppers, {y: -149.45}, 0.3, {ease: FlxEase.quartIn});
			if (FlxG.save.data.distractions)
				FlxTween.tween(frontboppers, {y: -39.55}, 0.3, {ease: FlxEase.quartIn});
		
			eventEnter();

			changePc('whittysimp dance');

		}

		if (curBeat == 360) // 360)
		{
			playState.isMidSongEvent = true;
			dancing = true;
		}

		if (dancing)
		{
			if (FlxG.save.data.distractions)
			{
				bf.y += 20;
				dad.y += 20;
				backboppers.y += 30;
				frontboppers.y += 30;

				playState.defaultCamZoom = 0.9;
				FlxTween.tween(bf, {y: bfy}, (Conductor.stepCrochet * 3 / 1000), {ease: FlxEase.circInOut});
				FlxTween.tween(dad, {y: gfy}, (Conductor.stepCrochet * 3 / 1000), {ease: FlxEase.circInOut});
				FlxTween.tween(backboppers, {y: -60}, (Conductor.stepCrochet * 3 / 1000), {ease: FlxEase.circOut});
				FlxTween.tween(frontboppers, {y: 50}, (Conductor.stepCrochet * 3 / 1000), {ease: FlxEase.quartInOut});
				heartsThings.add(new HeartThingy(FlxG.random.int(0, 1280), 650, FlxG.random.float(1.8, 2.4)));
			}

		}

		else
		{
			bfy = bf.y;
			gfy = dad.y;
		}
		

	}

	public override function initBGChars()
	{
		characters_walking = new FlxSprite(820, 200);
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

		//copy no jutsu
		if (dancing)
		{
			playState.defaultCamZoom = 0.9;
		}
		else
		{
			bfy = bf.y;
			gfy = dad.y;
		}

		// heartbeat too
		if (FlxG.save.data.distractions && characters_walking.animation != null && characters_walking.animation.curAnim != null)
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
						if (playState.curBeat > stopSTOPITSTOPITNOW)
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
						if (playState.curBeat > stopSTOPITSTOPITNOW)
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
						if (playState.curBeat > stopSTOPITSTOPITNOW)
							moveNOWWW = false;
					}
					else
					{
						if (!charswhohavewalked.contains(characters_walking.animation.curAnim.name))
							charswhohavewalked.push(characters_walking.animation.curAnim.name);
					}
				}
			}
		}

		if (charswhohavewalked.length >= chars.length)
			charswhohavewalked = [];
		if (charswhohavewalked2.length >= chars2.length)
			charswhohavewalked2 = [];
		if (farris_wheel != null)
		{
			if (FlxG.save.data.distractions)
				farris_wheel.angle += 0.25;

			plane.x -= 1;
			for (i in 0...24)
			{
				var fss = farris_seat.members[i];
				var _angle = (farris_wheel.angle + (i / 24) * 360) * (Math.PI / 180); // Convert to radians
				var rotatedX = Math.cos(_angle) * (350 - 227) - Math.sin(_angle) * (350 - 153.85) + 227;
				var rotatedY = Math.sin(_angle) * (350 - 227) + Math.cos(_angle) * (350 - 153.85) + 153.85;

				fss.setPosition(100 + rotatedX - 15, rotatedY);
			}
			if (plane.x < -610)
				plane.x = 1800;
		}

	}

	override function createLights()
	{
		var light:FlxSprite = new FlxSprite(450, -650).loadGraphic(Paths.image('bg/date/light', 'mods'));
		light.antialiasing = true;
		light.scale.y = 1;
		light.scale.x = 1;
		playState.add(light);
	}



}
