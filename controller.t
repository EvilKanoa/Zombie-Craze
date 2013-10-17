class Controller
    
    import Input
    export update, getModX, getModY
    
    var chars : array char of boolean
    var modX, modY : int := 0
    
    procedure update()
        Input.KeyDown(chars)
        
        if chars ('w') then
            modY := modY + 1
        end if
        if chars ('s') then
            modY := modY - 1
        end if
        if chars ('d') then
            modX := modX + 1
        end if
        if chars ('a') then
            modX := modX - 1
        end if
    end update
    
    function getModX() : int
        var tempX : int := modX
        modX := 0
        result tempX
    end getModX
    
    function getModY() : int
        var tempY : int := modY
        modY := 0
        result tempY
    end getModY

end Controller