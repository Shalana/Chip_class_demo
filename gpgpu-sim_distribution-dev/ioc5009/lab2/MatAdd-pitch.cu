#include<stdio.h>
#include<cuda.h>
#include<cuda_runtime.h>

#define N 512
#define BLOCK_SIZE 16

__global__ void MatAdd(float *A, float *B, 
		       float *C, size_t pitch)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

   
    if(i < N && j < N)
    {
	// compute C = A + B


    }
}

int main()
{

    float h_A[N][N], h_B[N][N], h_C[N][N];
    float *d_A, *d_B, *d_C;

    size_t pitch;
    int i, j;

    // init data
    for(i = 0; i < N; i++)
    {
	for(j = 0; j < N; j++)
	{
	    h_A[i][j] = 1.0;
	    h_B[i][j] = 2.0;
	    h_C[i][j] = 0.0;
	}
    }

    // allocate device memory cudaMallocPitch

    // transfer data to device cudaMemcpy2D


    // declare CTA
    dim3 blockSize(BLOCK_SIZE, BLOCK_SIZE);
    dim3 numBlock( , );

    // MatAdd kernel
    MatAdd<<<numBlock, blockSize>>>(d_A, d_B, d_C, pitch);
    cudaDeviceSynchronize();

    // transfer data back to host cudaMemcpy2D


    // verify results
    int flag = 0;
    for(i = 0; i < N; i++)
    {
	for(j = 0; j < N; j++)
	{
	    if(h_C[i][j] != 3.0)
	    {
		flag = 1;
		printf("Error:%f, h[%d][%d]\n", h_C[i][j], i, j);
		break;
	    }
	}
    }

    if(!flag)
        printf("PASS\n");
    else
        printf("Fail\n");

    // free memory
    cudaFree(d_A);
    cudaFree(d_B);
    cudaFree(d_C);
    return 0;
}
