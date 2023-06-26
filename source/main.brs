sub Main()

	screen = CreateObject("roSGScreen")
	m.port = CreateObject("roMessagePort")
	screen.setMessagePort(m.port)
	scene = screen.CreateScene("MainScreen")

	m.global = screen.getGlobalNode()
	m.global.id = "GlobalNode"

	' Where I would usually put things that I would use, you know... globally.
	m.global.addFields( {
		"X-Access-Key" : "$2b$10$aoACF.9P0WVp1wi8w2P.T.WuxaHxuiqzDvHAjg1WgAit2eXUKfJjy"
		"testUrl" : "https://api.jsonbin.io/v3/b/631f5e595c146d63ca98e072"
	} )
			
	screen.show()  
	
	while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
		end if
	end while

end sub
