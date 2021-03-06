#include <vector>

typedef struct
{
    unsigned int x;
    unsigned int y;
    unsigned int externalPipeIndex;
    unsigned int dir;
} pipe;

typedef struct
{
    int x;
    int y;
    int tex;
    int subimage;
    int subimageCounter;
    int dir;
    int externallyControlled;
    int pipe;
    int animTime;
    int motion;
} link;

typedef struct
{
    unsigned int width;
    link* linkPointer;
    int linkImage;
    int pipeImage;
    int pipeCount;
    std::vector<pipe> pipeVector;
} nes_wall;
