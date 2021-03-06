#include "gameMakerLibrary.hpp"
#include "nes_wall.hpp"
#include "link.hpp"
#include "malloc.h"
#include "math.h"

link* createLink(int pipeID)
{
    link* linkPointer = (link*)malloc(sizeof(link));
    linkPointer->x = 0;
    linkPointer->y = 0;
    linkPointer->subimage = 0;
    linkPointer->dir = 0;
    linkPointer->externallyControlled = 1;
    linkPointer->pipe = pipeID;
    linkPointer->animTime = 0;
    linkPointer->motion = 1;
    return linkPointer;
}

void updateLink(nes_wall* wall)
{
    link* linkPointer = wall->linkPointer;

    //SMB_Link_setSubimageCounter(argument[0],(SMB_Link_getSubimageCounter(argument[0])+1) mod 4);
    //SMB_Link_setSubimage(argument[0],floor(SMB_Link_getSubimageCounter(argument[0])/2));
    //SMB_Link_setDirection(argument[0],);

    if (linkPointer->externallyControlled == 0)
    {
        int L = keyboard_check(*vk_left);
        int R = keyboard_check(*vk_right);
        int U = keyboard_check(*vk_up);
        int D = keyboard_check(*vk_down);

        int H = - L + (1-L)*R;
        int V = - U + (1-U)*D;

        linkPointer->x = linkPointer->x + 3*(1 - V*V)*H + V*V*(2*((linkPointer->x % 16) > 8)-1)*((linkPointer->x % 16) != 0);// + (8-abs((x mod 16)-8))*V*(2*((x mod 16) > 8)-1)*(abs((x mod 16)-8) > 5));
        linkPointer->y = linkPointer->y + 3*V + (1 - V*V)*H*H*(2*((linkPointer->y % 16) > 8)-1)*((linkPointer->y % 16) != 0);

        if ((1 - V*V)*H != 0)
        {
            linkPointer->dir = -(1 - V*V)*H + 2;
            linkPointer->subimageCounter = (linkPointer->subimageCounter+1) % 6;
            linkPointer->subimage = floor(linkPointer->subimageCounter/3);
        } else if (V != 0)
        {
            linkPointer->dir = -V + 1;
            linkPointer->subimageCounter = (linkPointer->subimageCounter + 1) % 6;
            linkPointer->subimage = floor(linkPointer->subimageCounter/3);
        }

        int linkX1 = linkPointer->x;
        int linkX2 = linkPointer->x+16;
        int linkY1 = linkPointer->y;
        int linkY2 = linkPointer->y+16;

        linkPointer->pipe = -1;

        for (int i = 0; i < wall->pipeCount; i++)
        {
            pipe p = wall->pipeVector[i];
            int x = p.x;
            int y = p.y;
            int dir = p.dir;

            int pipeX1 = x + 14*(1-(dir % 2))*(2 - dir) + 4*(dir % 2);
            int pipeX2 = x + (1-(dir % 2))*(32 - 14*dir) + 28*(dir % 2);
            int pipeY1 = y + 14*(dir % 2)*(dir - 1) + 4*(1-(dir % 2));
            int pipeY2 = y + (dir % 2)*(14*dir - 10) + 28*(1-(dir % 2));

            if (linkPointer->y < pipeY2 && (linkPointer->y+16) > pipeY1 && linkPointer->x < pipeX2 && (linkPointer->x+16) > pipeX1)
                linkPointer->pipe = i;
        }

        if (linkPointer->pipe != -1)
        {
            linkPointer->motion = 2;
            linkPointer->externallyControlled = 1;
        }
    } else if (linkPointer->motion == 2)
    {
        if (linkPointer->animTime == 24)
        {
            int pipe = linkPointer->pipe;
            free(linkPointer);
            link_leave_wall(pipe);
            wall->linkPointer=NULL;
            return;
        }

        if (linkPointer->animTime < 24)
        {
            pipe p = wall->pipeVector[linkPointer->pipe];
            int x = p.x;
            int y = p.y;
            int dir = p.dir;

            linkPointer->x = (24-linkPointer->animTime)*(1-(dir % 2))*(1 - dir) + x + 8;
            linkPointer->y = (24-linkPointer->animTime)*(dir % 2)*(dir - 2) + y + 8;

            linkPointer->animTime += 1;
            linkPointer->dir = (dir+3) % 4;
        }
    } else if (linkPointer->motion == 1)
    {
        if (linkPointer->animTime == 25 && linkPointer->motion == 1)
        {
            linkPointer->animTime = 0;
            linkPointer->motion = 0;
            linkPointer->externallyControlled = 0;
        }

        if (linkPointer->motion == 1 && linkPointer->animTime >= 0)
        {
            pipe p = wall->pipeVector[linkPointer->pipe];
            int x = p.x;
            int y = p.y;
            int dir = p.dir;

            linkPointer->x = (linkPointer->animTime)*(1-(dir % 2))*(1 - dir) + x + 8;
            linkPointer->y = (linkPointer->animTime)*(dir % 2)*(dir-2) + y + 8;

            linkPointer->animTime += 1;
            linkPointer->dir = (dir+1) % 4;
        }
    }


/*everything below was already commented out. Likely broken code. Needs to be evaluated.*/
/*

var leftCollision;
var rightCollision;
var i;

leftCollision = false;
rightCollision = false;

i = 0;

leftBlockCollision = (linkX1 mod 16 == 4 && blockList[floor(linkX1/16) + 1,floor(linkY1/16)] > 0) || (linkX1 mod 16 == 4 && linkY1 mod 16 > 4 && blockList[floor(linkX1/16) + 1,floor(linkY1/16) + 1] > 0);
rightBlockCollision = (linkX1 mod 16 == 12 && blockList[floor(linkX1/16),floor(linkY1/16)] > 0) || (linkX1 mod 16 == 12 && linkY1 mod 16 > 4 && blockList[floor(linkX1/16),floor(linkY1/16) + 1] > 0);
upBlockCollision = (linkY1 mod 16 <= 4 && blockList[floor(linkX1/16),floor(linkY1/16) + 1] > 0) || (linkY1 mod 16 <= 4 && linkX1 mod 16 > 0 && blockList[floor(linkX1/16) + 1,floor(linkY1/16) + 1] > 0);
downBlockCollision = (linkY1 mod 16 >= (16 + SMB_Link_getYSpeed(argument[0]) - 1) && blockList[floor(linkX1/16),floor(linkY1/16)] > 0) || (linkY1 mod 16 >= (16 + SMB_Link_getYSpeed(argument[0])) && linkX1 mod 16 > 0 && blockList[floor(linkX1/16) + 1,floor(linkY1/16)] > 0);


if (linkX1 == 4*(x2-x1)-12 || leftBlockCollision)
{
    SMB_Link_setX(argument[0],SMB_Link_getX(argument[0])-4);
}

if (linkX1 == -4 || rightBlockCollision)
{
    SMB_Link_setX(argument[0],SMB_Link_getX(argument[0])+4);
}

if (upBlockCollision || linkY2 > 4*(z2-z1))
{
    SMB_Link_setY(argument[0],SMB_Link_getY(argument[0]) - (linkY1 mod 16));
    if (keyboard_check_pressed(ord('I')) && SMB_Link_getYSpeed(argument[0]) == 4)
    {
       SMB_Link_setYSpeed(argument[0],-10)
    }
}

if (downBlockCollision || linkY1 < 0)
{
    SMB_Link_setY(argument[0],SMB_Link_getY(argument[0]) + 16 - (SMB_Link_getY(argument[0]) mod 16));
}*/

    return;
}

void drawLink(nes_wall* wall)
{
    link* linkPointer = wall->linkPointer;
    d3d_draw_floor(linkPointer->x, linkPointer->y, 0, linkPointer->x + 8, linkPointer->y + 8, 0, wall->linkImage, 1, 1);
    //draw_sprite(wall->linkImage, linkPointer->subimage+2*linkPointer->dir, linkPointer->x, linkPointer->y);
}
