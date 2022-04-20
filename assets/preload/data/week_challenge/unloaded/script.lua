function onBeatHit()

    if curStep >= 448 and curStep < 704 then
        triggerEvent('Add Camera Zoom', '0.030', '0.01')
        cameraFlash('game','1000000',0.2,false)
    end
end

function onUpdate()
    if curStep >= 64 and curStep < 448 then
        if getProperty('boyfriend.curCharacter') == 'pico-uber' then
            if keyJustPressed('space') then
                characterPlayAnim('boyfriend', 'hey', true);
                setProperty('boyfriend.specialAnim', true);
            end
        end
    elseif curStep >= 448 and curStep < 576 then

    elseif curStep >= 576 and curStep < 832 then
        if getProperty('boyfriend.curCharacter') == 'pico-uber' then
            if keyJustPressed('space') then
                characterPlayAnim('boyfriend', 'hey', true);
                setProperty('boyfriend.specialAnim', true);
            end
        end
    elseif curStep >= 832 and curStep < 864 then

    elseif curStep >= 864 and curStep < 984 then
        if getProperty('boyfriend.curCharacter') == 'pico-uber' then
            if keyJustPressed('space') then
                characterPlayAnim('boyfriend', 'hey', true);
                setProperty('boyfriend.specialAnim', true);
            end
        end
    elseif curStep >= 984 and curStep < 992 then

    elseif curStep >= 992 and curStep < 1114 then
        if getProperty('boyfriend.curCharacter') == 'pico-uber' then
            if keyJustPressed('space') then
                characterPlayAnim('boyfriend', 'hey', true);
                setProperty('boyfriend.specialAnim', true);
            end
        end
    elseif curStep >= 1114 then

    end
end