-- Event notes hooks
function onEvent(event, v1, v2)
	if event == 'Fade Event' then
		cameraFade('other', v2, v1, false)
	end
end