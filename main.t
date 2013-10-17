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