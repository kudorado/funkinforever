function onUpdate()

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') then
        setProperty('cpuControlled', true)
    end

    if getProperty('boyfriend.curCharacter') == 'pico-uber' then    
        setPropertyFromClass('GameOverSubstate', 'characterName', 'picodeath-uber'); --Character json file for the death animation
        setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
        setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
        setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
    end

end