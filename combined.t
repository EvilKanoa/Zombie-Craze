
%The MIT License (MIT)
%
%Copyright (c) 2013 EvilKanoa
%
%Permission is hereby granted, free of charge, to any person obtaining a copy of
%this software and associated documentation files (the "Software"), to deal in
%the Software without restriction, including without limitation the rights to
%use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
%the Software, and to permit persons to whom the Software is furnished to do so,
%subject to the following conditions:
%
%The above copyright notice and this permission notice shall be included in all
%copies or substantial portions of the Software.
%
%THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
%FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
%COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
%IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
%CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
