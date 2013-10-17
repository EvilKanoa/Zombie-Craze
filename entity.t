class Entity

    export setPos2, setPos3, changePos2, changePos3, getX, getY, getZ
    
    var posX, posY, posZ : int
    
    procedure setPos3(x : int, y : int, z : int)
        posX := x
        posY := y
        posZ := z
    end setPos3
    
    procedure setPos2(x : int, y : int)
        posX := x
        posY := y
    end setPos2
    
    procedure changePos2(x : int, y : int)
        posX := posX + x
        posY := posY + y
    end changePos2
    
    procedure changePos3(x : int, y : int, z : int)
        posX := posX + x
        posY := posY + y
        posZ := posZ + z
    end changePos3
    
    function getX() : int
        result posX
    end getX
    
    function getY() : int
        result posY
    end getY
    
    function getZ() : int
        result posZ
    end getZ
    
end Entity