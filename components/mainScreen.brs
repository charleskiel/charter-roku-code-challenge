sub init()
	m.showingScreen = "A"
	m.status = CreateObject("roSGNode", "serverstatus")
	m.status.ObserveField("response", "statusResponse")

	m.mainOverlay = m.top.findnode("mainOverlay")
	m.screenA = m.top.findnode("ScreenA")
	m.screenB = m.top.findnode("ScreenB")
	m.SwitchScreenButton = m.top.findnode("SwitchScreenButton")

	m.testData = {}
	m.top.setFocus(true)
	? "Getting Status"
	m.status.control = "RUN"
end sub

function statusResponse(data)
	m.testData = data.getData()
	? "got test data"
	? m.testData.record
	m.screenA.callFunc("ShowOverlay", m.testData.record.ScreenA)
end function


function onKeyEvent(key as string, press as boolean) as boolean


	if key = "OK" and press = true
		' would use button's 
		m.SwitchScreenButton.textcolor = "0x00FF00A8"
	else  if key = "OK" and press = false
		m.SwitchScreenButton.textcolor = "0xFFFFFFFF"

		' Screen switch
		if m.showingScreen = "A"
			m.screenA.callFunc("HideOverlay")
			m.screenB.callFunc("ShowOverlay", m.testData.record.ScreenB)
			m.showingScreen = "B"
		else
			m.screenA.callFunc("ShowOverlay", m.testData.record.ScreenA)
			m.screenB.callFunc("HideOverlay")
			m.showingScreen = "A"
		end if
	end if


	if key = "replay" and press = true
		' refetch test data
		m.status.control = "RUN"
	end if

end function


