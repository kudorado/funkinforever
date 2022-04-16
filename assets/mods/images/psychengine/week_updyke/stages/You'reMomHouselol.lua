function onCreate()
	-- background shit
	makeLuaSprite('the_cool_place', 'the_cool_place', -600, -290);
	setScrollFactor('the_cool_place', 1.0, 1.0);
        scaleObject('the_cool_place', 1.0, 1.0);
        addLuaSprite('the_cool_place', false);
        setProperty('the_cool_place.visible', false);

        makeLuaSprite('the_place', 'the_place', -600, -290);
	setScrollFactor('the_place', 1.0, 1.0);
        scaleObject('the_place', 1.0, 1.0);
	addLuaSprite('the_place', false);
        setProperty('the_cool_place.visible', false);
	
        makeLuaSprite('sex-hq', 'sex-hq', -500, -290);
	setScrollFactor('sex-hq', 1.0, 1.0);
        scaleObject('sex-hq', 1.0, 1.0);
	addLuaSprite('sex-hq', false);
end

function onEvent(name,value1,value2)

       if name == 'Play Animation' then

               if value1 == 'black' then

                       setProperty('the_cool_place.visible', true);
                       setProperty('the_place.visible', false);
                       setProperty('sex-hq.visible', false);
               end
               if value1 == 'normal' then

                       setProperty('the_place.visible', true);
                       setProperty('the_cool_place.visible', false);
                       setProperty('sex-hq.visible', false);
               end
               if value1 == 'fakeout' then

                       setProperty('the_place.visible', false);
                       setProperty('the_cool_place.visible', false);
                       setProperty('sex-hq.visible', true);
        end

 end

end