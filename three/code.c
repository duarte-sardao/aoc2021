#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <math.h>


int count = 0;

int f(int s[])
{
	int n = 0;
	int i;

	int ord = 0;
	for (i = 11; i >= 0; i--) {
		printf("%d %d\n", i, s[i]*(int)pow(2, ord));
		n += s[i] * (int)pow(2, ord);
		ord++;
	}
	printf("%d\n", n);
	return n;
}

void printn(int numb[]) {
	printf("%d %d %d %d %d %d %d %d %d %d %d %d \n", numb[0], numb[1], numb[2], numb[3], numb[4], numb[5], numb[6], numb[7], numb[8], numb[9], numb[10], numb[11]);
}


void getAllow(const int poss[][12], int* ret) {
	printf("do we get here?\n");
	for (int i = 0; i < 1000; i++) {
		if (poss[i][0] == -1) {
			break;
		}
		for (int j = 0; j < 12; j++) {
			ret[j] += poss[i][j];
		}
	}
	printn(ret);
	for (int i = 0; i < 1000; i++) {
		if (ret[i] >= 500) {
			ret[i] = 1;
		}
		else {
			ret[i] = 0;
		}
	}
	printn(ret);
	printf("do we leave even\n");
	return;
}

int* returnGoodOne(int poss[][12], int pos) {
	//printn(poss[0]);
	int fin[12] = {0};
	printn(poss[0]);
	getAllow(poss, fin);
	//printn(fin);
	printn(poss[0]);
	for (int check = 0; check < 12; check++) {
		int passedtrough = 0;
		for (int i = 0; i < 1000; i++) {
			//printn(poss[i]);
			printf("wtf\n");
			if (poss[i][0] == -1) {
				break;
			}
			printf("hello\n");
			if (poss[i][check] == fin[check]) {
				if (!pos) {
					poss[i][0] = -1;
				}
				else {
					passedtrough++;
				}
			}
			else {
				if (pos) {
					poss[i][0] = -1;
				}
				else {
					passedtrough++;
				}
			}
		}
		printf("%d\n", passedtrough);
		if (passedtrough == 1) {
			for (int i = 0; i < 1000; i++) {
				if (poss[i][0] == -1) {
					break;
				}
				else {
					printn(poss[i]);
					return poss[i];
				}
			}
		}
	}
	return 0;
}


int main() {
	FILE* file_fd = fopen("input.txt", "r");
	int numb[12] = {0};
	char* line;
	size_t size = 12;
	line = (char*)malloc(size * sizeof(char));
	int o2[1000][12] = {0};
	int co2[1000][12] = {0};


	//printf("before getline\n", file_fd);
	while ((getline(&line, &size, file_fd)) != -1) {
		//printf("%s", line);
		//printf("%d %d %d %d %d %d %d %d %d %d %d %d \n", line[0], line[1], line[2], line[3], line[4], line[5], line[6], line[7], line[8], line[9], line[10], line[11], line[12]);
		for (int i = 0; i < 12; i++) {
			numb[i] += (line[i]-48); //woe where is my lovely zipWith (+) :pensive: also -48 to compensate for char its scuffado
			o2[count][i] = (line[i] - 48);
			co2[count][i] = (line[i] - 48);
		}
		count++;
	}
	//printf("after getline\n");

	//printf("%d %d %d %d %d %d %d %d %d %d %d %d \n", numb[0], numb[1], numb[2], numb[3], numb[4], numb[5], numb[6], numb[7], numb[8], numb[9], numb[10], numb[11], numb[12]);

	for (int i = 0; i < 12; i++) {
		if (numb[i] >= count / 2) {
			numb[i] = 1;
		}
		else {
			numb[i] = 0;
		}
	}
	
	//printf("%d %d %d %d %d %d %d %d %d %d %d %d \n", numb[0], numb[1], numb[2], numb[3], numb[4], numb[5], numb[6], numb[7], numb[8], numb[9], numb[10], numb[11], numb[12]);
	int revnumb[12];
	for (int i = 0; i < 12; i++) {
		revnumb[i] = (numb[i]-1)*(-1); //i was gonna do bitwise at first but eh
	}
	//printf("%d %d %d %d %d %d %d %d %d %d %d %d \n", revnumb[0], revnumb[1], revnumb[2], revnumb[3], revnumb[4], revnumb[5], revnumb[6], revnumb[7], revnumb[8], revnumb[9], revnumb[10], revnumb[11], revnumb[12]);

	printf("hiii\n");
	//printn(o2[0]);
	int* realo2 = returnGoodOne(o2, 1);
	int* realco2 = returnGoodOne(co2, 1);
	printf("%d %d %d %d %d %d %d %d %d %d %d %d \n", realo2[0], realo2[1], realo2[2], realo2[3], realo2[4], realo2[5], realo2[6], realo2[7], realo2[8], realo2[9], realo2[10], realo2[11]);
	printf("%d %d %d %d %d %d %d %d %d %d %d %d \n", realco2[0], realco2[1], realco2[2], realco2[3], realco2[4], realco2[5], realco2[6], realco2[7], realco2[8], realco2[9], realco2[10], realco2[11]);


	free(line);
	fclose(file_fd);
	//printf("%d\n", count);
	//printf("%d %d \n", f(numb), f(revnumb));
	//printf("%d", f(numb) * f(revnumb));
	return 0;
}

