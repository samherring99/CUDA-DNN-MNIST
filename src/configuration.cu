#include "configuration.h"

int Configuration::getIntValue(std::string variableName, int defaultValue) {
    char* envValue = std::getenv(variableName.c_str());
    if (!envValue) {
        return defaultValue;
    }
    return atoi(envValue);
}

float Configuration::getFloatValue(std::string variableName, float defaultValue) {
    char* envValue = std::getenv(variableName.c_str());
    if (!envValue) {
        return defaultValue;
    }
    return atof(envValue);
}

void Configuration::printCurrentConfiguration() {
    printf("=====================================\n");
    printf("            Configuration\n");
    printf("=====================================\n");
    printf(" NumberOfEpochs: %d\n", Configuration::numberOfEpochs);
    printf(" BatchSize: %d\n", Configuration::batchSize);
    printf(" LearningRate: %e\n", Configuration::learningRate);
    printf("=====================================\n");
    printf("\n");
}

void Configuration::printCUDAConfiguration() {
    printf("=====================================\n");
    printf("         CUDA Configuration\n");
    printf("=====================================\n");
    printf(" Tensor2DAddBlockSize: %d\n", Configuration::tensor2DAddBlockSize);
    printf(" Tensor2DSubtractBlockSize: %d\n", Configuration::tensor2DSubtractBlockSize);
    printf(" Tensor2DScaleBlockSize: %d\n", Configuration::tensor2DScaleBlockSize);
    printf(" Tensor2DMultiplyBlockSize: %d\n", Configuration::tensor2DMultiplyBlockSize);
    printf(" Tensor2DMultiplyBlockNumber: %d\n", Configuration::tensor2DMultiplyBlockNumber);
    printf(" Tensor2DMeanBlockSize: %d\n", Configuration::tensor2DMeanBlockSize);
    printf("-------------------------------------\n");
    printf(" ReLuBlockSize: %d\n", Configuration::reLuBlockSize);
    printf("-------------------------------------\n");
    printf(" CrossEntropyGetMetricBlockSize: %d\n", Configuration::crossEntropyGetMetricBlockSize);
    printf(" CrossEntropyCalculateBlockSize: %d\n", Configuration::crossEntropyCalculateBlockSize);
    printf("=====================================\n");
    printf("\n");
}

float Configuration::learningRate = getFloatValue("LEARNING_RATE", DEFAULT_LEARNING_RATE);
int Configuration::numberOfEpochs = getIntValue("NUMBER_OF_EPOCHS", DEFAULT_NUMBER_OF_EPOCHS);
int Configuration::batchSize = getIntValue("BATCH_SIZE", DEFAULT_BATCH_SIZE);

int Configuration::tensor2DAddBlockSize = getIntValue("TENSOR2D_ADD_BLOCK_SIZE", DEFAULT_TENSOR2D_ADD_BLOCK_SIZE);
int Configuration::tensor2DSubtractBlockSize = getIntValue("TENSOR2D_SUBTRACT_BLOCK_SIZE", DEFAULT_TENSOR2D_SUBTRACT_BLOCK_SIZE);
int Configuration::tensor2DScaleBlockSize = getIntValue("TENSOR2D_SCALE_BLOCK_SIZE", DEFAULT_TENSOR2D_SCALE_BLOCK_SIZE);
int Configuration::tensor2DMultiplyBlockSize = getIntValue("TENSOR2D_MULTIPLY_BLOCK_SIZE", DEFAULT_TENSOR2D_MULTIPLY_BLOCK_SIZE);
int Configuration::tensor2DMultiplyBlockNumber = getIntValue("TENSOR2D_MULTIPLY_BLOCK_NUMBER", DEFAULT_TENSOR2D_MULTIPLY_BLOCK_NUMBER);
int Configuration::tensor2DMeanBlockSize = getIntValue("TENSOR2D_MEAN_BLOCK_SIZE", DEFAULT_TENSOR2D_MEAN_BLOCK_SIZE);

int Configuration::reLuBlockSize = getIntValue("RELU_BLOCK_SIZE", DEFAULT_TENSOR2D_RELU_BLOCK_SIZE);

int Configuration::crossEntropyGetMetricBlockSize = getIntValue("CROSSENTROPY_GET_METRIC_BLOCK_SIZE", DEFAULT_CROSSENTROPY_GET_METRIC_BLOCK_SIZE);
int Configuration::crossEntropyCalculateBlockSize = getIntValue("CROSSENTROPY_CALCULATE_BLOCK_SIZE", DEFAULT_CROSSENTROPY_CALCULATE_BLOCK_SIZE);
