package reactor;

import openfl.Lib;
import flixel.FlxG;
import reator.*;
import selection.*;
import ui.*;

class KadeEngineData
{

    public static function initSave()
    {
	
        initSkinData();
        initVfxData();
        initPcData();
        initPlayModeData();

		if (FlxG.save.data.scrollId == null)
		{
			FlxG.save.data.scrollId = 1;
		}

        if (FlxG.save.data.showDadNote == null)
        {
            FlxG.save.data.showDadNote = false;
        }

		if (FlxG.save.data.musicListening == null)
		{
			FlxG.save.data.musicListening = false;
		}

        if (FlxG.save.data.showCombo == null)
        {
            FlxG.save.data.showCombo = true;
        }

        if (FlxG.save.data.showBF == null)
        {
            FlxG.save.data.showBF = true;
        }

        if (FlxG.save.data.showDad == null)
        {
            FlxG.save.data.showDad = true;
        }

        if (FlxG.save.data.showGF == null)
        {
            FlxG.save.data.showGF = true;
        }

        if (FlxG.save.data.showBG == null)
        {
            FlxG.save.data.showBG = true;
        }

        if (FlxG.save.data.showCombo == null)
        {
            FlxG.save.data.showCombo = true;
        }
            

        if (FlxG.save.data.newInput == null)
            FlxG.save.data.newInput = true;

        if (FlxG.save.data.downscroll == null)
            FlxG.save.data.downscroll = false;

        if (FlxG.save.data.dfjk == null)
            FlxG.save.data.dfjk = false;

        if (FlxG.save.data.accuracyDisplay == null)
            FlxG.save.data.accuracyDisplay = true;

        if (FlxG.save.data.offset == null)
            FlxG.save.data.offset = 0;

        if (FlxG.save.data.songPosition == null)
            FlxG.save.data.songPosition = false;

        if (FlxG.save.data.fps == null)
            FlxG.save.data.fps = false;

        if (FlxG.save.data.changedHit == null)
        {
            FlxG.save.data.changedHitX = -1;
            FlxG.save.data.changedHitY = -1;
            FlxG.save.data.changedHit = false;
        }

        if (FlxG.save.data.fpsRain == null)
            FlxG.save.data.fpsRain = false;

        if (FlxG.save.data.fpsCap == null)
            FlxG.save.data.fpsCap = 60;

        if (FlxG.save.data.fpsCap > 285 || FlxG.save.data.fpsCap < 60)
            FlxG.save.data.fpsCap = 60; // baby proof so you can't hard lock ur copy of kade engine

        if (FlxG.save.data.scrollSpeed == null)
            FlxG.save.data.scrollSpeed = 1;

        if (FlxG.save.data.npsDisplay == null)
            FlxG.save.data.npsDisplay = false;

        if (FlxG.save.data.frames == null)
            FlxG.save.data.frames = 10;

        if (FlxG.save.data.accuracyMod == null)
            FlxG.save.data.accuracyMod = 1;

        if (FlxG.save.data.watermark == null)
            FlxG.save.data.watermark = true;

        if (FlxG.save.data.ghost == null)
            FlxG.save.data.ghost = true;

        if (FlxG.save.data.distractions == null)
            FlxG.save.data.distractions = true;

        if (FlxG.save.data.flashing == null)
            FlxG.save.data.flashing = true;

        if (FlxG.save.data.resetButton == null)
            FlxG.save.data.resetButton = false;

        if (FlxG.save.data.botplay == null)
            FlxG.save.data.botplay = false;

        if (FlxG.save.data.cpuStrums == null)
            FlxG.save.data.cpuStrums = true;

        if (FlxG.save.data.strumline == null)
            FlxG.save.data.strumline = false;

        if (FlxG.save.data.customStrumLine == null)
            FlxG.save.data.customStrumLine = 0;

        if (FlxG.save.data.mobileControl == null)
            FlxG.save.data.mobileControl = 8;

        Conductor.recalculateTimings();
        PlayerSettings.player1.controls.loadKeyBinds();
        KeyBinds.keyCheck();

        Main.watermarks = FlxG.save.data.watermark;

        (cast(Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);
    }


	private static function initPlayModeData()
	{
		// yeah pc id
		if (FlxG.save.data.playModeId == null)
		{
			// default pc, boyfriend!
			FlxG.save.data.playModeId = 0;
		}
		else
		{
			if (FlxG.save.data.playModeId >= PlayModeManager.playModeList.length)
			{
				// out of range, force reset
				FlxG.save.data.playModeId = 0;
			}
		}

		if (FlxG.save.data.initPlayMode == null)
		{
			FlxG.save.data.initPlayMode = true;
			var playModeData:Array<Int> = new Array<Int>();

			// push data to array
			for (i in 0...PlayModeManager.playModeList.length)
			{
				playModeData.push(0);
			}

			FlxG.save.data.playModeData = playModeData;
		}
		else
		{
			var different:Int = Std.int(PlayModeManager.playModeList.length - FlxG.save.data.playModeData.length);
			if (different > 0) // in case update new pc
			{
				var playModeData:Array<Int> = FlxG.save.data.playModeData;

				for (i in 0...different)
				{
					playModeData.push(0);
				}

				FlxG.save.data.playModeData = playModeData;
			}
		}
	
	}

	private  static function initPcData()
	{
		// yeah pc id
		if (FlxG.save.data.pcId == null)
		{
			// default pc, boyfriend!
			FlxG.save.data.pcId = 0;
		}
		else
		{
			if (FlxG.save.data.pcId >= PcManager.pcList.length)
			{
				// out of range, force reset
				FlxG.save.data.pcId = 0;
			}
		}

		if (FlxG.save.data.initPc == null)
		{
			FlxG.save.data.initPc = true;
			var pcData:Array<Int> = new Array<Int>();

			// push data to array
			for (i in 0...PcManager.pcList.length)
			{
				pcData.push(0);
			}

			FlxG.save.data.pcData = pcData;
		}
		else
		{
			var different:Int = Std.int(PcManager.pcList.length - FlxG.save.data.pcData.length);
			if (different > 0) // in case update new pc
			{
				var pcData:Array<Int> = FlxG.save.data.pcData;

				for (i in 0...different)
				{
					pcData.push(0);
				}

				FlxG.save.data.pcData = pcData;
			}
		}
	}

	private static function initSkinData()
	{
		// yeah pc id
		if (FlxG.save.data.skinId == null)
		{
			// default pc, boyfriend!
			FlxG.save.data.skinId = 0;
		}
		else
		{
			if (FlxG.save.data.skinId >= SkinManager.skinList.length)
			{
				// out of range, force reset
				FlxG.save.data.skinId = 0;
			}
		}

		if (FlxG.save.data.initSkin == null)
		{
			FlxG.save.data.initSkin = true;
			var skinData:Array<Int> = new Array<Int>();

			// push data to array
			for (i in 0...SkinManager.skinList.length)
			{
				skinData.push(0);
			}

			FlxG.save.data.skinData = skinData;
		}
		else
		{
			var different:Int = Std.int(SkinManager.skinList.length - FlxG.save.data.skinData.length);
			if (different > 0) // in case update new pc
			{
				var skinData:Array<Int> = FlxG.save.data.skinData;

				for (i in 0...different)
				{
					skinData.push(0);
				}

				FlxG.save.data.skinData = skinData;
			}
		}
    
    }

	private static function initVfxData()
	{
		// yeah pc id
		if (FlxG.save.data.vfxId == null)
		{
			// default pc, boyfriend!
			FlxG.save.data.vfxId = 0;
		}
		else
		{
			if (FlxG.save.data.vfxId >= VfxManager.vfxList.length)
			{
				// out of range, force reset
				FlxG.save.data.vfxId = 0;
			}
		}

		if (FlxG.save.data.initVfx == null)
		{
			FlxG.save.data.initVfx = true;
			var vfxData:Array<Int> = new Array<Int>();

			// push data to array
			for (i in 0...VfxManager.vfxList.length)
			{
				vfxData.push(0);
			}

			FlxG.save.data.vfxData = vfxData;
		}
		else
		{
			var different:Int = Std.int(VfxManager.vfxList.length - FlxG.save.data.vfxData.length);
			if (different > 0) // in case update new pc
			{
				var vfxData:Array<Int> = FlxG.save.data.vfxData;

				for (i in 0...different)
				{
					vfxData.push(0);
				}

				FlxG.save.data.vfxData = vfxData;
			}
		}
        
    }

}
