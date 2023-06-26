sub init()
    m.top.functionName = "executeTask"
end sub

function executeTask() as void
	? "ServerStatus executeTask"
	json = get(m.global.testUrl)

	if json <> invalid
		m.top.response = json
	else
		? "Error"
	end if
    
	m.top.control = "stop"
end function

function get(url as string) as string
	port = CreateObject("roMessagePort")
	request = CreateObject("roUrlTransfer")
	request.SetMessagePort(port)
	request.SetCertificatesFile("common:/certs/ca-bundle.crt")
	request.RetainBodyOnError(true)
	request.AddHeader("X-Access-Key", m.global["X-Access-Key"])
	request.SetRequest("GET")
	request.SetUrl(url)
	requestSent = request.AsyncGetToString()
	if (requestSent)
		msg = wait(0, port)
		if (type(msg) = "roUrlEvent")
			res = msg.GetString()
        	end if
	end if
	
	return res
end function

