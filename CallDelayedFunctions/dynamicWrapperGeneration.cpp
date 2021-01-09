#include <stdio.h>
#include <malloc.h>
#include <string.h>
//rs

int walk_function(FILE* inputFile, FILE* outputFile, FILE* outputFile2)
{
    int began = 0;
    int ended = 0;
    int c = fgetc(inputFile);

    while (!ended && c != EOF)
    {
        if (c == ' ')
        {
            ended = began;
            began = 1;
        }
        c = fgetc(inputFile);
    }

    if (c == EOF)
        return c == EOF;

    began = 0;
    ended = 0;

    char* functionName = (char*)malloc(sizeof(char));
    functionName[0] = 0;
    int functionNameLength = 0;

    while (!ended && c != EOF)
    {
        if (c == '(')
        {
            ended = 1;
        } else
        {
            char* tempFunctionName = (char*)malloc((functionNameLength+2)*sizeof(char));
            strcpy(tempFunctionName, functionName);
            tempFunctionName[functionNameLength] = c;
            tempFunctionName[functionNameLength+1] = 0;
            free(functionName);
            functionName = tempFunctionName;
            functionNameLength++;
        }
        c = fgetc(inputFile);
    }

    fprintf(outputFile, "GMEXPORT double get_%s()\n", functionName);
    fprintf(outputFile, "{\n");
    fprintf(outputFile, "    return (double)(int)%s;\n", functionName);
    fprintf(outputFile, "}\n");

    fprintf(outputFile2, "if (function_to_call == (void*)%s)\n", functionName);
    fprintf(outputFile2, "    function_return_value = %s(", functionName);

    int argumentCount = 0;
    int waitingTillComma = 0;
    ended = 0;

    while (!ended && c != EOF)
    {
        if (c == ')')
        {
            ended = 1;
        } else if (c == 'd' && !waitingTillComma)
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
        c = fgetc(inputFile);
    }

    fprintf(outputFile2, ");\n");
    return c == EOF;
}

int walk_GML_function(FILE* inputFile, FILE* outputFile, FILE* outputFile2)
{
    int ended = 0;
    int functionType = 2;
    int c = fgetc(inputFile);

    while (!ended && c != EOF)
    {
        if (c == ' ')
        {
            ended = 1;
        } else if (c == 'v' && functionType == 2)
        {
            functionType = 0;
        } else if (c == 'd' && functionType == 2)
        {
            functionType = 1;
        }
        c = fgetc(inputFile);
    }

    if (c == EOF)
        return c == EOF;

    ended = 0;

    char* functionName = (char*)malloc(sizeof(char));
    functionName[0] = 0;
    int functionNameLength = 0;

    while (!ended && c != EOF)
    {
        if (c == '(')
        {
            ended = 1;
        } else
        {
            char* tempFunctionName = (char*)malloc((functionNameLength+2)*sizeof(char));
            strcpy(tempFunctionName, functionName);
            tempFunctionName[functionNameLength] = c;
            tempFunctionName[functionNameLength+1] = 0;
            free(functionName);
            functionName = tempFunctionName;
            functionNameLength++;
        }
        c = fgetc(inputFile);
    }

    fprintf(outputFile, "ADD_FUNCTION(%s)\n", functionName);

    int argumentCount = 0;
    int* argumentType = NULL;
    int waitingTillComma = 0;
    ended = 0;

    while (!ended && c != EOF)
    {
        if (c == ')')
        {
            ended = 1;
        } else if (c == 'd' && !waitingTillComma)
        {
            int* argumentTypeTemp = (int*)malloc((argumentCount+1)*sizeof(int));
            memcpy(argumentTypeTemp, argumentType, argumentCount*sizeof(int));
            argumentTypeTemp[argumentCount] = 0;
            free(argumentType);
            argumentType = argumentTypeTemp;
            waitingTillComma = 1;
            argumentCount++;
        } else if (c == 'c' && !waitingTillComma)
        {
            int* argumentTypeTemp = (int*)malloc((argumentCount+1)*sizeof(int));
            memcpy(argumentTypeTemp, argumentType, argumentCount*sizeof(int));
            argumentTypeTemp[argumentCount] = 1;
            free(argumentType);
            argumentType = argumentTypeTemp;
            argumentCount++;
        } else if (c == ',' && waitingTillComma)
        {
            waitingTillComma = 0;
        }

        c = fgetc(inputFile);
    }

    if (functionType == 0)
    {
        fprintf(outputFile2, "void %s(", functionName);
    } else if (functionType == 1)
    {
        fprintf(outputFile2, "double %s(", functionName);
    }

    for (int i = 0; i < argumentCount; i++)
    {
        if (argumentType[i] == 0)
        {
            fprintf(outputFile2, "double input%u", i);
        } else if (argumentType[i] == 1)
        {
            fprintf(outputFile2, "const char* input%u", i);
        }

        if (i+1 < argumentCount)
        {
            fprintf(outputFile2, ", ");
        }
    }

    fprintf(outputFile2, ")\n");
    fprintf(outputFile2, "{\n");

    if (functionType == 0)
    {
        fprintf(outputFile2, "    addDelayedFunctionCall(FP_%s, 0", functionName);
    } else if (functionType == 1)
    {
        fprintf(outputFile2, "    return addDelayedFunctionCall(FP_%s, 1", functionName);
    }

    for (int i = 0; i < argumentCount; i++)
    {
        fprintf(outputFile2, ", input%u", i);
    }

    fprintf(outputFile2, ");\n");
    fprintf(outputFile2, "}\n");
    return c == EOF;
}

void parse_GML_header(FILE* outputFile, char* inputFileName)
{
    FILE* inputFile = fopen(inputFileName, "r");

    while (1)
    {
        if (walk_GML_function(inputFile, outputFile, outputFile))
        {
            return;
        }
    }
}

void parse_GML_libraries()
{
    char* outputFileName = "gameMakerGenLibrary.hpp";
    FILE* outputFile = fopen(outputFileName, "w");

    parse_GML_header(outputFile, "gameMakerFunctions\\3DGraphics\\d3d_model.hpp");
    parse_GML_header(outputFile, "gameMakerFunctions\\3DGraphics\\d3d_primitive.hpp");
    parse_GML_header(outputFile, "gameMakerFunctions\\3DGraphics\\d3d_shape.hpp");
    parse_GML_header(outputFile, "gameMakerFunctions\\3DGraphics\\d3d_transform.hpp");

    parse_GML_header(outputFile, "gameMakerFunctions\\gameGraphics\\fontsAndText.hpp");

    parse_GML_header(outputFile, "gameMakerFunctions\\userInteraction\\mouse.hpp");
    parse_GML_header(outputFile, "gameMakerFunctions\\userInteraction\\keyboard.hpp");
    parse_GML_header(outputFile, "gameMakerFunctions\\userInteraction\\joystick.hpp");

    parse_GML_header(outputFile, "gameMakerFunctions\\gamePlay\\rooms.hpp");
}

int main()
{
    char* inputFileName = "gameLoop.hpp";
    FILE* inputFile = fopen(inputFileName, "r");

    char* outputFileName = "getGameLoop.hpp";
    FILE* outputFile = fopen(outputFileName, "w");

    char* outputFileName2 = "callGameLoop.hpp";
    FILE* outputFile2 = fopen(outputFileName2, "w");

    while (1)
    {
        if (walk_function(inputFile, outputFile, outputFile2))
        {
            break;
        }
    }

    parse_GML_libraries();
}
