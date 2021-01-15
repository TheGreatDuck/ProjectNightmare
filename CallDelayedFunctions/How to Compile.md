**NOTE:** Compiling CallDelayedFunctions by yourself is not necessary. It should be done only if Project Nightmare gets new functions/scripts that are required for CDF-related systems (i.e. NES walls) to operate.

In order to compile the Wrapper Generator and the DLL itself, you need CodeBlocks and a 32-bit compiler (CodeBlocks pre-bundled with 32-bit MinGW works well).

**1.** Open "CallDelayedFunctions.cbp".

**2.** While the project file is open, change the current project from "Release" to "WrapperGenerator".

**3.** Add the compiler flag "-static" (this will save you some time by not erroring out over missing DLLs), then build WrapperGenerator.

**4.** Drag "ProjectNightmare.project.gmx" over to the CallDelayedFunctions folder, then open the "WrapperGenerator.exe" that you built earlier. WrapperGenerator will link the appropriate GameMaker functions to CallDelayedFunctions in order for the DLL to work. After opening WrapperGenerator, a few new files will appear. These will be used in order to completely build CallDelayedFunctions.

**5.** Set the current project in CodeBlocks back to "Release", then build CallDelayedFunctions.

After following these steps, you will have built a fresh new "CallDelayedFunctions.dll". Simply replace the current build in ProjectNightmare\datafiles with this one.
