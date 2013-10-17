%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name: Zombie Craze                                          %
% Programmer: Kanoa Haley                                     %
% Date Started: 16/10/2013                                    %
% Description: TODO                                           %
% Info: Make game using combine.jar on all the files in this  %
%       folder.                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% From: controller.t

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

%% From: entity.t

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

var coords : ^Entity
var controller : ^Controller
const speed : int := 10

new coords
new controller
coords -> setPos2(maxx div 2, maxy div 2)
View.Set("offscreenonly:800;600")
loop
    Draw.Cls
    controller -> update()
    coords -> changePos2(controller -> getModX() * speed, controller -> getModY() * speed)
    Draw.FillOval(coords -> getX(), coords -> getY(), 30, 30, red)
    View.Update
    Time.Delay(100)
end loop
