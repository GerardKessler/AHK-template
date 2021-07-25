IfNotExist, hks\config.ini
fileCreate()
else
fileRead()

fileCreate() {
	global hks
	for k, value in hks
		{
		element := strSplit(value, ",")
		iniWrite,% element[1], hks\config.ini,% element[2], hk
		}
	fileRead()
	}

fileRead() {
	iniRead, iniContent, hks\config.ini
	loop, parse, iniContent, `n`r
		{
		iniRead, hk, hks\config.ini, %a_loopField%, hk
		hotkey, %hk%, %a_loopField%, on
		}
	}
