local darnellfire = false;
local nenestab = false;

function onCreate()

    makeLuaSprite('sky','uberkids/bgsky',100,100)
    addLuaSprite('sky',false)
    setLuaSpriteScrollFactor('sky',0.95,0.8)
    scaleObject('sky',1.2,1.2)

    makeLuaSprite('bgfront','uberkids/bgfront',100,100)
    addLuaSprite('bgfront',false)
    setLuaSpriteScrollFactor('bgfront',1.0,1.0)
    scaleObject('bgfront',1.2,1.2)

    makeAnimatedLuaSprite('boppers','uberkids/frontmeat',370,830)
    addAnimationByPrefix('boppers','meatbop','frontbounce',24,false)
    addLuaSprite('boppers',true)
    setLuaSpriteScrollFactor('boppers',1.6,0.85)

    makeAnimatedLuaSprite('runningdummy','uberkids/runninguberkid',-400,700)
    addAnimationByPrefix('runningdummy','run','UberKidRun',24,true)

    makeAnimatedLuaSprite('runningbgdummy','uberkids/runninguberkid',-560,610)
    addAnimationByPrefix('runningbgdummy','run','UberKidRun',24,true)
    addLuaSprite('runningbgdummy',false)
    scaleObject('runningbgdummy',0.85,0.85)

    makeAnimatedLuaSprite('stabuberkid','uberkids/uberkiddeaths',200,520)
    addAnimationByPrefix('stabuberkid','stab','UberKidGettingStabbed',24,true)
    addLuaSprite('stabuberkid',false)
    scaleObject('stabuberkid',0.85,0.85)
    doTweenAlpha('stabhide', 'stabuberkid', 0.0, 0.01, 'circOut')

    makeAnimatedLuaSprite('runningbgdummy2','uberkids/runninguberkidtwo',2800,610)
    addAnimationByPrefix('runningbgdummy2','run','runninguberkidtwo',24,true)
    addLuaSprite('runningbgdummy2',false)
    scaleObject('runningbgdummy2',0.85,0.85)

    makeAnimatedLuaSprite('fireuberkid','uberkids/uberkiddeaths',1540,610)
    addAnimationByPrefix('fireuberkid','fire','UberKidBurnt',24,true)
    addLuaSprite('fireuberkid',false)
    scaleObject('fireuberkid',0.85,0.85)
    doTweenAlpha('firehide', 'fireuberkid', 0.0, 0.01, 'circOut')

    makeAnimatedLuaSprite('head','uberkids/uberheaddeath',0,1400)
    addAnimationByIndices('head','idle','front 1 head die','1,1,1,1,1,1,1,1,1,1,1,1,1,1,1',24)
    addAnimationByPrefix('head','death','front 1 head die',24,false)

    makeAnimatedLuaSprite('charger','uberkids/charginguberkid',-300,500)
    addAnimationByPrefix('charger','spawn','UberKidChargingUp',24,false)
    addLuaSprite('charger',true)
    doTweenAlpha('chargerhide', 'charger', 0.0, 0.01, 'circOut')

    makeAnimatedLuaSprite('charger2','uberkids/chargertwo',1400,500)
    addAnimationByPrefix('charger2','spawn','chargertwo',24,false)
    addLuaSprite('charger2',true)
    doTweenAlpha('charger2hide', 'charger2', 0.0, 0.01, 'circOut')

    makeAnimatedLuaSprite('cutscene','uberkids/cutscene',-900,-600)
    addAnimationByPrefix('cutscene','buscutscene','ComicPannel',24,false)
    setObjectCamera('cutscene','hud')
    scaleObject('cutscene',0.65,0.65)

    makeAnimatedLuaSprite('bus','uberkids/bus',-3600,500)
    addAnimationByPrefix('bus','bus','Bus',24,true)
    addLuaSprite('bus',false)
    scaleObject('bus',0.85,0.85)

    makeAnimatedLuaSprite('buskid','uberkids/buskid',-1200,640)
    addAnimationByPrefix('buskid','buskid','uberkidbus instance 1',24,true)
    addLuaSprite('buskid',false)
    doTweenAlpha('buskidhide', 'buskid', 0.0, 0.01, 'circOut')

    makeAnimatedLuaSprite('finalpunch','uberkids/finalpunch',670,420)
    addAnimationByPrefix('finalpunch','finalpunch','FinalPunch',24,false)
    addLuaSprite('finalpunch',false)
    doTweenAlpha('punchhide', 'finalpunch', 0.0, 0.01, 'circOut')

    makeAnimatedLuaSprite('nene','uberkids/nene-uber',720,434)
    addAnimationByPrefix('nene','dance','Nene Idle',24,false)
    addAnimationByPrefix('nene','stab','Nene Stab',24,false)
    addLuaSprite('nene',true)

    makeAnimatedLuaSprite('darnell','uberkids/darnell-uber',1150,380)
    addAnimationByPrefix('darnell','dance','Darnell Idle',24,false)
    addAnimationByPrefix('darnell','burn','DarnellBurn',24,false)
    addLuaSprite('darnell',true)

    makeAnimatedLuaSprite('picobds','uberkids/picobdshootin',1050,650)
    addAnimationByPrefix('picobds','shootin','PicoBreakDanceShootin',24,true)
    addLuaSprite('picobds',false)

    makeLuaSprite('body','uberkids/deadbody',-140,540)
    addLuaSprite('body',false)
    doTweenAlpha('bodyhide', 'body', 0.0, 0.01, 'linear')

    setObjectOrder('picobds',1);
    setObjectOrder('sky',1);
    setObjectOrder('bgfront',2);
    setObjectOrder('fireuberkid',3);
    setObjectOrder('nene',4);
    setObjectOrder('stabuberkid',5);
    setObjectOrder('runningbgdummy',6);
    setObjectOrder('runningbgdummy',7);
    setObjectOrder('darnell',8);
    setObjectOrder('gfGroup',9);
    setObjectOrder('runningdummy',10);
    setObjectOrder('bus',11);
    setObjectOrder('buskid',12);
    setObjectOrder('bfGroup',13);
    setObjectOrder('body',15);
end

function onBeatHit()
    objectPlayAnimation('boppers','meatbop',true)
    
    if not nenestab then
        objectPlayAnimation('nene','dance',true)
        setProperty('nene.offset.y',0)
    elseif nenestab then

    end
   

    if not darnellfire then
        objectPlayAnimation('darnell','dance',true)
        setProperty('darnell.offset.y',0)
    elseif darnellfire then

    end

    if curBeat % 16 == 6 then
        doTweenX('bgrunner', 'runningbgdummy', 420, 0.8, 'linear')
        runTimer('bgrunnerstab',0.8)
        runTimer('prestab',0.6)
    end
    if curBeat % 24 == 14 then
        doTweenX('bgrunner2', 'runningbgdummy2', 1600, 0.8, 'linear')
        runTimer('bgrunnerfire',0.8)
        runTimer('prefire',0.6)
    end
end

function onEvent(n,v1,v2)
    if n == "dummy" then 
        if v1 == 'dummyrun' then
            objectPlayAnimation('runningdummy','run',true)
            doTweenX('runningdummytweenend', 'runningdummy', 560, 0.7, 'circOut')
            runTimer('deadbody',0.28)
        end
    end
    if n == "breakdance" then
        if v1 == 'fmhide' then
            doTweenY('frontmeathide', 'boppers', 1600, 0.7, 'circInOut')
        elseif v1 == 'fmheads' then
            addLuaSprite('head',true)
            doTweenY('frontheadtween', 'head', 720, 0.8, 'circOut')
        elseif v1 == 'death' then
            objectPlayAnimation('head','death',true)
            triggerEvent('Screen Shake','0.2, 0.01','0.1, 0.01')
            doTweenY('frontheaddeath', 'head', 2000, 1, 'circInOut')
        end
    end
    if n == "frontcharger" then
        if v1 == 'spawn' then
            doTweenAlpha('chargershow', 'charger', 1.0, 0.01, 'circOut')
            objectPlayAnimation('charger','spawn',true)
            runTimer('chargerhide',0.8)
        end
    end
    if n == "frontchargertwo" then
        if v1 == 'spawn' then
            doTweenAlpha('charger2show', 'charger2', 1.0, 0.01, 'circOut')
            objectPlayAnimation('charger2','spawn',true)
            runTimer('charger2hide',0.8)
        end
    end
    if n == "cutscene" then
        if v1 == 'show' then
            addLuaSprite('cutscene',true)
            runTimer('tweenintro',0.2)
        elseif v1 == 'hide' then
            runTimer('tweenoutro',0.2)
        elseif v1 == 'shoot' then
            objectPlayAnimation('cutscene','buscutscene',true)
        elseif v1 == 'bus' then
            runTimer('buskidshow',0.5)
            doTweenX('bustween', 'bus', 3200, 2, 'linear')
            doTweenX('buskidtween', 'buskid', 5600, 2, 'linear')
        end
    end
    if n == "punch" then
        if v1 == 'show' then
            doTweenAlpha('punchshow', 'finalpunch', 1.0, 0.01, 'circOut')
            cameraFlash('game','1000000',0.3,false)
            objectPlayAnimation('finalpunch','finalpunch',true)
            cameraSetTarget('finalpunch')
        end
    end
    if n == "Play Animation" then 
        if v1 == 'ubershoot' then
            triggerEvent('Screen Shake','0.2, 0.01','0.1, 0.01')
        elseif v1 == 'shootLeft' then
            triggerEvent('Screen Shake','0.2, 0.01','0.1, 0.01')
        elseif v1 == 'shootRight' then
            triggerEvent('Screen Shake','0.2, 0.01','0.1, 0.01')
        elseif v1 == 'busshoot' then
            triggerEvent('Screen Shake','0.2, 0.01','0.1, 0.01')
        elseif v1 == 'idle-bd' then
            objectPlayAnimation('picobds','shootin',true)
        elseif v1 == 'bds' then
            setObjectOrder('picobds',14)
            setObjectOrder('bfGroup',1)
            triggerEvent('Screen Shake','0.2, 0.01','0.1, 0.01')
            runTimer('bdshide',0.1)
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'runningdummytweenend' then
        triggerEvent('Play Animation','idle','dad')
        doTweenAlpha('dadshow', 'dad', 1.0, 0.01, 'circOut')
        doTweenX('runningdummyreset', 'runningdummy', -400, 0.01, 'circOut')
    elseif tag == 'frontmeathide' then
        removeLuaSprite('boppers',true)
    elseif tag == 'frontheaddeath' then
        removeLuaSprite('head',false)
    elseif tag == 'busdadhide' then
        runTimer('busdummyrun',2)
    elseif tag == 'dodgetween' then
        doTweenY('dodgetweenend', 'boyfriend', 760, 0.7, 'circOut')
    elseif tag == 'bodypull' then
        doTweenAlpha('bodyhide', 'body', 0.0, 0.01, 'linear')
        doTweenX('bodyreset', 'body', -140, 0.01, 'linear')
    end
end

function onTimerCompleted(tag,loops,loopsLeft)
    if tag == 'chargerhide' then
        doTweenAlpha('chargerhide', 'charger', 0.0, 0.01, 'circOut')
    elseif tag == 'charger2hide' then
        doTweenAlpha('charger2hide', 'charger2', 0.0, 0.01, 'circOut')
    elseif tag == 'tweenintro' then
        doTweenY('cutsceney', 'cutscene', -100, 0.8, 'circOut')
        doTweenX('cutscenex', 'cutscene', -400, 0.8, 'circOut')
    elseif tag == 'tweenoutro' then
        doTweenY('cutsceneouty', 'cutscene', -600, 0.8, 'circOut')
        doTweenX('cutsceneoutx', 'cutscene', -900, 0.8, 'circOut')
    elseif tag == 'buskidshow' then
        doTweenAlpha('buskidshow', 'buskid', 1.0, 0.01, 'circOut')
        triggerEvent('Play Animation','dodge','bf')
        doTweenY('dodgetween', 'boyfriend', 870, 0.8, 'circOut')
        doTweenAlpha('busdadhide', 'dad', 0.0, 0.01, 'circOut')
    elseif tag == 'busdummyrun' then    
        triggerEvent('dummy','dummyrun','')
    elseif tag == 'bdshide' then    
        setObjectOrder('picobds',1)
        setObjectOrder('bfGroup',13)
    elseif tag == 'bgrunnerstab' then    
        doTweenX('bgrunnerreset', 'runningbgdummy', -560, 0.01, 'circOut')
        objectPlayAnimation('stabuberkid','stab',true)
        doTweenAlpha('stabshow', 'stabuberkid', 1.0, 0.01, 'circOut')
        runTimer('stabend',1.3)
    elseif tag == 'stabend' then    
        doTweenAlpha('stabhide', 'stabuberkid', 0.0, 0.01, 'linear')
        nenestab = false;
    elseif tag == 'bgrunnerfire' then    
        doTweenX('bgrunner2reset', 'runningbgdummy2', 2800, 0.01, 'linear')
        objectPlayAnimation('fireuberkid','stab',true)
        doTweenAlpha('fireshow', 'fireuberkid', 1.0, 0.01, 'linear')
        runTimer('fireend',1.3)
    elseif tag == 'fireend' then    
        doTweenAlpha('firehide', 'fireuberkid', 0.0, 0.01, 'linear')
        darnellfire = false;
    elseif tag == 'prefire' then
        darnellfire = true;
        objectPlayAnimation('darnell','burn',true)
        setProperty('darnell.offset.y',50)
    elseif tag == 'prestab' then
        nenestab = true;
        objectPlayAnimation('nene','stab',true)
        setProperty('nene.offset.y',80)
    elseif tag == 'deadbody' then
        doTweenAlpha('dadhide', 'dad', 0.0, 0.01, 'circOut')
        doTweenAlpha('bodyshow', 'body', 1.0, 0.01, 'linear')
        doTweenX('bodypull', 'body', -1000, 0.5, 'circIn')
    end
end
