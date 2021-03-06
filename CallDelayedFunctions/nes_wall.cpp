#include "gameMakerLibrary.hpp"
#include "nes_wall.hpp"
#include "link.hpp"

GMEXPORT double create_nes_wall(double width, double height)
{
    nes_wall* wall = new nes_wall();
    wall->linkPointer = NULL;
    wall->pipeImage = 0;
    wall->linkImage = 1;
    return (double)(int)wall;
}

GMEXPORT double update_nes_wall(double wall_double)
{
    nes_wall* wall = (nes_wall*)(int)wall_double;
    if (wall->linkPointer)
        updateLink(wall);
    return 1.0;
}

GMEXPORT double draw_nes_wall(double wall_double)
{
    nes_wall* wall = (nes_wall*)(int)wall_double;
    if (wall->linkPointer)
        drawLink(wall);
    for (auto p : wall->pipeVector)
        d3d_draw_floor(p.x, p.y, 0, p.x + 16, p.y + 16, 0, wall->pipeImage, 1, 1);
    return 1.0;
}

GMEXPORT double add_link_to_wall(double wall_double, double pipeIndex)
{
    nes_wall* wall = (nes_wall*)(int)wall_double;
    wall->linkPointer = createLink(pipeIndex);
    return 1.0;
}

GMEXPORT double add_pipe_to_wall(double wall_double, double externalPipeIndex, double dir, double x, double y)
{
    nes_wall* wall = (nes_wall*)(int)wall_double;
    pipe p;
    p.externalPipeIndex = externalPipeIndex;
    p.x = x;
    p.y = y;
    p.dir = dir;

    wall->pipeVector.push_back(p);
    wall->pipeCount++;
    return wall->pipeCount-1;
}

GMEXPORT double delete_nes_wall(double wall_double)
{
    delete((void*)(int)wall_double);
    return 1.0;
}
