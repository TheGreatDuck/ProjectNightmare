#include "gameMakerLibrary.hpp"
#include "gameLoop.hpp"

/** \brief
 *
 * \param
 * \param
 * \return
 *
 */
GMEXPORT double get_gameLoopInit()
{
    return (double)(int)gameLoopInit;
}

/** \brief
 *
 * \param
 * \param
 * \return
 *
 */
GMEXPORT double gameLoopInit(char* external_program_directory)
{
    return 1.0;
}

/** \brief
 *
 * \param
 * \param
 * \return
 *
 */
GMEXPORT double get_gameLoopStep()
{
    return (double)(int)gameLoopStep;
}

/** \brief
 *
 * \param
 * \param
 * \return
 *
 */
GMEXPORT double gameLoopStep()
{
    return 1.0;
}

/** \brief
 *
 * \param
 * \param
 * \return
 *
 */
GMEXPORT double get_gameLoopDraw()
{
    return (double)(int)gameLoopDraw;
}

/** \brief
 *
 * \param
 * \param
 * \return
 *
 */
GMEXPORT double gameLoopDraw()
{
    return 1.0;
}
