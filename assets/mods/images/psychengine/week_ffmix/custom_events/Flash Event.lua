-- Event notes hooks
function onEvent(event, v1, v2)
	if event == 'Flash Event' then
		cameraFlash('other', v2, v1, false)
	end
end