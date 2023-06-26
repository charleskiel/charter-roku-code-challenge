sub init()

	m.mainPoster = m.top.findnode("mainPoster")
	m.logoPoster = m.top.findnode("logoPoster")
	m.titleLabel = m.top.findnode("titleLabel")
	m.numberSetLabel = m.top.findnode("numberSetLabel")

	m.logoPoster.translation = [m.mainPoster.width / 2, m.mainPoster.height / 2]
	
	m.top.ObserveField("screenData", "setScreenData")
	m.overlayFadeOut = m.top.FindNode("overlayfadeout")
	m.overlayFadeIn = m.top.FindNode("overlayfadein")
	
	m.sortTasks = CreateObject("roSgNode", "SortTasks")
	m.sortTasks.ObserveField("results", "resultsResponse")

end sub

function resultsResponse(ns)
	numberSet = ns.getData()
	? "resultsResponse" + m.top.id
	m.numberSetLabel.text = ""
	for each item in numberSet
		m.numberSetLabel.text = m.numberSetLabel.text + item.tostr() + chr(10)
	end for
end function


function ShowOverlay(data)
	? "ShowOverlay" + m.top.id
	m.titleLabel.text = data.title
	m.logoPoster.uri = data.logo
	? "numberSet" + m.top.id
	? m.sortTasks["numberSet" + m.top.id]
	m.sortTasks["numberSet" + m.top.id] = data.numberSet
	if m.mainPoster.opacity = 0 then
		m.overlayFadeIn.control = "start"
	end if

	'the images seem to be the same so I'm adding a red tint to ScreenB to look like the PDF
	if m.top.id = "ScreenB" then
		m.logoPoster.blendColor = "0xFF0000FF"
	else
		m.logoPoster.blendColor = "0xFFFFFFFF"
	endif


end function


function HideOverlay()
	? "hideOverlay" + m.top.id
	m.overlayFadeOut.control = "start"
end function

