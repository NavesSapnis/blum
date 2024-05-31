#Requires AutoHotkey v2.0
;



global toggle := false
0::ToggleSearch()

ToggleSearch(*) {
    global toggle
    toggle := !toggle

    if (toggle)
        SetTimer(FindAndClickPixel, 51)
    else
        SetTimer(FindAndClickPixel, 0)
}

FindAndClickPixel() {
    try{
    WinGetPos(&X, &Y, &W, &H, "TelegramDesktop")
    searchArea := { 
        x1: 0, 
        y1: H, 
        x2: W, 
        y2: 0 
    }
    }
    catch{
        MsgBox("Open the Blum first please")
        ToggleSearch()
        return
    }
    

    if(PixelSearch(&posX, &posY, searchArea.x1, searchArea.y1, searchArea.x2, searchArea.y2, 0xc9d800, 5)){
        Click("down", posX, posY)
        Sleep(50)
        Click("up", posX, posY)
    }
    if(PixelSearch(&posX, &posY, searchArea.x1, searchArea.y1, searchArea.x2, searchArea.y2, 0xef6775, 10)){
        Click("down", posX, posY)
        Sleep(50)
        Click("up", posX, posY)
    }
    
}

MyGui := Gui()
MyGui.Add("Text","w200 Section Center", "Press 0 for start/stop")
MyGui.Add("Text","w200 Center Section", "or use button")
MyBtn := MyGui.Add("Button", "Default Section w200 h50", "start/stop")
MyBtn.OnEvent("Click", ToggleSearch)
MyGui.Show