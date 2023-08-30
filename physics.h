// Copyright 2011 Nigel Kilmer
// Beret is licensed under the terms of the GNU Lesser GPL v3.0

float apply_friction(float, float);

void get_collisions(Thing*, int [500][500][3], Thing [250],
                    Thing*, ThingNode* [251], int, int, int, int*, int*);

void apply_collisions(Thing*, int*, Thing [250], int*, int);

float approach(float, float, float);
