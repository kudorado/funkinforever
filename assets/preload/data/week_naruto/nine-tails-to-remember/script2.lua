local angleshit = 1;
local anglevar = 1;
function onBeatHit()
    if curBeat > 175 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*5)
        setProperty('camGame.angle',angleshit*5)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*9, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*9, crochet*0.001, 'linear')

     if curBeat > 343 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*0)
        setProperty('camGame.angle',angleshit*0)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.001, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*9, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.001, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*9, crochet*0.001, 'linear')

     if curBeat > 480 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*5)
        setProperty('camGame.angle',angleshit*5)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*9, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*9, crochet*0.001, 'linear')
           
                end

         end
    end
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.03);
        end
    end
end
