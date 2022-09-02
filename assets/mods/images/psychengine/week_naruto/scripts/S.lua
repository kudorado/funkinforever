function onCreatePost() --script made by impostor, credit me now or i will do an unfunny
    makeLuaText("message", "Song by : SmokeCannon", 500, 1000, 50)
    setTextAlignment("message", "left")
    addLuaText("message")

    if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('message.y', 680)
        setProperty('engineText.y', 660)
    end
end