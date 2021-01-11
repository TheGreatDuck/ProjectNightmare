#include <stdio.h>
#include <malloc.h>
#include <string.h>
#include <stdbool.h>
//rs

void no_pump_input(FILE* inputFile, const char* match)
{
    int c;
    int length = strlen(match);
    char* matchCheck = (char*)alloca(sizeof(*matchCheck)*length);
    memset(matchCheck, 0, sizeof(*matchCheck)*length);

    while ((c = fgetc(inputFile)) != EOF)
    {
        for (int i = 0; i < length-1; i++)
        {
            matchCheck[i] = matchCheck[i+1];
        }
        matchCheck[length-1] = c;

        if (!memcmp(match, matchCheck, length))
            return;
    }
}

void pump_input_till_eof(FILE* inputFile, FILE* outputFile)
{
    int c;

    while ((c = fgetc(inputFile)) != EOF)
        fputc(c, outputFile);
}

void pump_input(FILE* inputFile, FILE* outputFile, const char* match)
{
    int c;
    int length = strlen(match);
    char* matchCheck = (char*)alloca(sizeof(*matchCheck)*length);
    memset(matchCheck, 0, sizeof(*matchCheck)*length);

    while ((c = fgetc(inputFile)) != EOF)
    {
        for (int i = 0; i < length-1; i++)
        {
            matchCheck[i] = matchCheck[i+1];
        }
        matchCheck[length-1] = c;
        fputc(c, outputFile);
        if (!memcmp(match, matchCheck, length))
            return;
    }
}

char* getFunctionName(FILE* inputFile)
{
    char* functionName = (char*)malloc(sizeof(*functionName));
    functionName[0] = 0;
    int functionNameLength = 0;
    int c;

    while ((c = fgetc(inputFile)) != EOF)
    {
        if (c == '(')
            break;
        else
        {
            functionName = (char*)realloc(functionName, sizeof(functionName)*(functionNameLength+2));
            functionName[functionNameLength] = c;
            functionName[functionNameLength+1] = 0;
            functionNameLength++;
        }
    }

    return functionName;
}

bool walk_DLL_function(FILE* inputFile, FILE* outputFile, FILE* outputFile2)
{
    if (fscanf(inputFile, "%*[^ ])") == EOF) return 1;
    if (fscanf(inputFile, "%*1[ ]%*[^ ])") == EOF) return 1;
    if (fgetc(inputFile) != ' ') return 1;

    int c;
    char* functionName = getFunctionName(inputFile);

    fprintf(outputFile, "GMEXPORT double get_%s()\n", functionName);
    fprintf(outputFile, "{\n");
    fprintf(outputFile, "    return (double)(int)%s;\n", functionName);
    fprintf(outputFile, "}\n");

    fprintf(outputFile2, "if (function_to_call == (void*)%s)\n", functionName);
    fprintf(outputFile2, "    function_return_value = %s(", functionName);

    int argumentCount = 0;
    int waitingTillComma = 0;

    while ((c = fgetc(inputFile)) != EOF)
    {
        if (c == ')')
            break;
        else if (c == 'd' && !waitingTillComma)
        {
            fprintf(outputFile2, "dll_input[%u].number", argumentCount);
            waitingTillComma = 1;
            argumentCount++;
        } else if (c == 'c' && !waitingTillComma)
        {
            fprintf(outputFile2, "dll_input[%u].text", argumentCount);
            waitingTillComma = 1;
            argumentCount++;
        } else if (c == ',' && waitingTillComma)
        {
            fprintf(outputFile2, ", ");
            waitingTillComma = 0;
        }
    }

    fprintf(outputFile2, ");\n");
    return c == EOF;
}

bool walk_GML_function(FILE* inputFile, FILE* outputFile, FILE* outputFile2, FILE* projectFileOut)
{
    int functionType = 2;
    int c;

    while ((c = fgetc(inputFile)) != EOF)
    {
        if (c == ' ')
            break;
        else if (c == 'v' && functionType == 2)
            functionType = 0;
        else if (c == 'd' && functionType == 2)
            functionType = 1;
    }

    if (c == EOF)
        return c == EOF;

    char* functionName = getFunctionName(inputFile);

    fprintf(projectFileOut, "\n        <script>scripts\\scr_wrapper_%s.gml</script>", functionName);
    fprintf(outputFile, "ADD_FUNCTION(%s)\n", functionName);

    fprintf(outputFile2, "global.delayCallDLL_export_%s = external_define(\"CallDelayedFunctions.dll\", \"export_%s\", dll_cdecl, ty_real, 1, ty_real);\n", functionName, functionName);
    fprintf(outputFile2, "external_call(global.delayCallDLL_export_%s, scr_wrapper_%s);\n", functionName, functionName);

    int argumentCount = 0;
    int* argumentType = NULL;
    int waitingTillComma = 0;

    while ((c = fgetc(inputFile)) != EOF)
    {
        if (c == ')')
            break;
        else if (c == 'd' && !waitingTillComma)
        {
            argumentType = (int*)realloc(argumentType, sizeof(*argumentType)*(argumentCount+1));
            argumentType[argumentCount] = 0;
            waitingTillComma = 1;
            argumentCount++;
        } else if (c == 'c' && !waitingTillComma)
        {
            argumentType = (int*)realloc(argumentType, sizeof(*argumentType)*(argumentCount+1));
            argumentType[argumentCount] = 1;
            waitingTillComma = 1;
            argumentCount++;
        } else if (c == ',' && waitingTillComma)
            waitingTillComma = 0;
    }

    if (functionType == 0)
        fprintf(outputFile, "void %s(", functionName);
    else if (functionType == 1)
        fprintf(outputFile, "double %s(", functionName);

    for (int i = 0; i < argumentCount; i++)
    {
        if (argumentType[i] == 0)
            fprintf(outputFile, "double input%u", i);
        else if (argumentType[i] == 1)
            fprintf(outputFile, "const char* input%u", i);

        if (i+1 < argumentCount)
            fprintf(outputFile, ", ");
    }

    fprintf(outputFile, ")\n");
    fprintf(outputFile, "{\n");

    if (functionType == 0)
        fprintf(outputFile, "    addDelayedFunctionCall(FP_%s, 0", functionName);
    else if (functionType == 1)
        fprintf(outputFile, "    return addDelayedFunctionCall(FP_%s, 1", functionName);

    for (int i = 0; i < argumentCount; i++)
        fprintf(outputFile, ", input%u", i);

    fprintf(outputFile, ");\n");
    fprintf(outputFile, "}\n");

    char* scriptFileName = (char*)alloca(strlen("..\\scripts\\scr_wrapper_") + strlen(functionName) + strlen(".gml"));
    scriptFileName[0] = '\0';
    strcat(scriptFileName, "..\\scripts\\scr_wrapper_");
    strcat(scriptFileName, functionName);
    strcat(scriptFileName, ".gml");
    FILE* scriptFile = fopen(scriptFileName, "w");

    if (functionType == 0)
        fprintf(scriptFile, "%s(", functionName);
    else if (functionType == 1)
        fprintf(scriptFile, "return %s(", functionName);

    for (int i = 0; i < argumentCount; i++)
    {
        fprintf(scriptFile, "argument[%u]", i);

        if (i+1 < argumentCount)
            fprintf(scriptFile, ",");
    }

    fprintf(scriptFile, ");\n");

    return c == EOF;
}

void walk_GML_header(FILE* outputFile, FILE* outputFile2, FILE* projectFileOut, const char* inputFileName)
{
    FILE* inputFile = fopen(inputFileName, "r");

    while (!walk_GML_function(inputFile, outputFile, outputFile2, projectFileOut))
        ;
}

void walk_GML_libraries(FILE* projectFileOut)
{
    FILE* outputFile = fopen("gameMakerGenLibrary.hpp", "w");
    FILE* outputFile2 = fopen("..\\scripts\\scr_delayCallDLL_exportWrapperFunctions.gml", "w");

    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\3DGraphics\\d3d_model.hpp");
    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\3DGraphics\\d3d_primitive.hpp");
    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\3DGraphics\\d3d_shape.hpp");
    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\3DGraphics\\d3d_transform.hpp");

    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\gameGraphics\\fontsAndText.hpp");

    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\userInteraction\\mouse.hpp");
    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\userInteraction\\keyboard.hpp");
    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\userInteraction\\joystick.hpp");

    walk_GML_header(outputFile, outputFile2, projectFileOut, "gameMakerFunctions\\gamePlay\\rooms.hpp");
}

int main()
{
    FILE* inputFile = fopen("gameLoop.hpp", "r");
    FILE* outputFile = fopen("getGameLoop.hpp", "w");
    FILE* outputFile2 = fopen("callGameLoop.hpp", "w");

    FILE* projectFileIn = fopen("ProjectNightmare.project.gmx", "r");
    FILE* projectFileOut = fopen("..\\ProjectNightmare.project.gmx", "w");
    pump_input(projectFileIn, projectFileOut, "<scripts name=\"GML Calling DLL Interface\">");
    fprintf(projectFileOut, "\n      <scripts name=\"Internal\">");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_getInput.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_exportWrapperFunctions.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_callQueuedFunctions.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_removeDelayedFunctionCall.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_getInputDelayedVariable.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_getInputText.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_getInputNumber.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_getInputType.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_getFunction.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_setDelayedOutput.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_getHasOutput.gml</script>");
    fprintf(projectFileOut, "\n        <script>scripts\\scr_delayCallDLL_isThereDelayedFunctionCall.gml</script>");
    fprintf(projectFileOut, "\n      </scripts>");
    fprintf(projectFileOut, "\n      <scripts name=\"Wrapper Functions\">");

    while (!walk_DLL_function(inputFile, outputFile, outputFile2))
        ;

    walk_GML_libraries(projectFileOut);

    no_pump_input(projectFileIn, "\n    </scripts>\n");
    fprintf(projectFileOut, "\n      </scripts>");
    fprintf(projectFileOut, "\n      <script>scripts\\scr_initDelayedCallingDLL.gml</script>");
    fprintf(projectFileOut, "\n      <script>scripts\\scr_get_DLL_function.gml</script>");
    fprintf(projectFileOut, "\n      <script>scripts\\scr_call_DLL_function.gml</script>");
    fprintf(projectFileOut, "\n    </scripts>\n");
    pump_input_till_eof(projectFileIn, projectFileOut);
}
