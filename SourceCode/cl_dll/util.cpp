/***
*
*	Copyright (c) 1999, Valve LLC. All rights reserved.
*	
*	This product contains software technology licensed from Id 
*	Software, Inc. ("Id Technology").  Id Technology (c) 1996 Id Software, Inc. 
*	All Rights Reserved.
*
*   Use, distribution, and modification of this source code and/or resulting
*   object code is restricted to non-commercial enhancements to products from
*   Valve LLC.  All other use, distribution, or modification is prohibited
*   without written permission from Valve LLC.
*
****/
//
// util.cpp
//
// implementation of class-less helper functions
//

#include "STDIO.H"
#include "STDLIB.H"
#include "MATH.H"

#include "hud.h"
#include "cl_util.h"
#include <string.h>

#ifndef M_PI
#define M_PI		3.14159265358979323846	// matches value in gcc v2 math.h
#endif

vec3_t vec3_origin( 0, 0, 0 );

double sqrt(double x);

float Length(const float *v)
{
	int		i;
	float	length;
	
	length = 0;
	for (i=0 ; i< 3 ; i++)
		length += v[i]*v[i];
	length = sqrt (length);		// FIXME

	return length;
}

void VectorAngles( const float *forward, float *angles )
{
	float	tmp, yaw, pitch;
	
	if (forward[1] == 0 && forward[0] == 0)
	{
		yaw = 0;
		if (forward[2] > 0)
			pitch = 90;
		else
			pitch = 270;
	}
	else
	{
		yaw = (atan2(forward[1], forward[0]) * 180 / M_PI);
		if (yaw < 0)
			yaw += 360;

		tmp = sqrt (forward[0]*forward[0] + forward[1]*forward[1]);
		pitch = (atan2(forward[2], tmp) * 180 / M_PI);
		if (pitch < 0)
			pitch += 360;
	}
	
	angles[0] = pitch;
	angles[1] = yaw;
	angles[2] = 0;
}

float VectorNormalize (float *v)
{
	float	length, ilength;

	length = v[0]*v[0] + v[1]*v[1] + v[2]*v[2];
	length = sqrt (length);		// FIXME

	if (length)
	{
		ilength = 1/length;
		v[0] *= ilength;
		v[1] *= ilength;
		v[2] *= ilength;
	}
		
	return length;

}

void VectorInverse ( float *v )
{
	v[0] = -v[0];
	v[1] = -v[1];
	v[2] = -v[2];
}

void VectorScale (const float *in, float scale, float *out)
{
	out[0] = in[0]*scale;
	out[1] = in[1]*scale;
	out[2] = in[2]*scale;
}

void VectorMA (const float *veca, float scale, const float *vecb, float *vecc)
{
	vecc[0] = veca[0] + scale*vecb[0];
	vecc[1] = veca[1] + scale*vecb[1];
	vecc[2] = veca[2] + scale*vecb[2];
}

HSPRITE LoadSprite(const char *pszName)
{
	int i;
	char sz[256]; 

	if (ScreenWidth < 640)
		i = 320;
	else
		i = 640;

	sprintf(sz, pszName, i);

	return SPR_Load(sz);
}

int stricmp(const char *a, const char *b)
{
	const char *s1 = a, *s2 = b;
	
	while (toupper(*s1) == toupper(*s2))
	{
		if (*s1 == 0)
			return 0;
		s1++;
		s2++;
	}
	
	return toupper(*(unsigned const char *)s1) - toupper(*(unsigned const char *)(s2));
}

int isspace(int character)
{
	switch (character)
	{
		case ' ':
		case '\t':	
		case '\n':
		case '\v':
		case '\f':
		case '\r':
			return 1;
			break;
		default:
			break;
	}
	
	return 0;
}

int strnicmp(const char *a, const char *b, int n)
{
	const char *s1 = a, *s2 = b;
	
	while (toupper(*s1) == toupper(*s2))
	{
		if (*s1 == 0 || !n)
			return 0;
		s1++;
		s2++;
		n--;
	}
	
	return toupper(*(unsigned const char *)s1) - toupper(*(unsigned const char *)(s2));
}

int isprint(int ch)
{
	if (ch > 0x1F && ch < 0x7F)
		return 1;
	
	return 0;
}

int isalpha(int ch)
{
	if ((ch > 0x40 && ch < 0x5B) || (ch > 0x60 && ch < 0x7B))
		return 1;
	
	return 0;
}

int isdigit(int ch)
{
	if (ch > 0x2F && ch < 0x3A)
		return 1;
	
	return 0;
}

int isalnum(int ch)
{
	if(isalpha(ch) || isdigit(ch))
		return 1;
	
	return 0;
}

const char itoa_lower_digits[17] = "0123456789abcdef";

char *itoa(int value, char *str, int base)
{
	if (!str)
		return NULL;
	
	unsigned int i, val;
	
	if (value < 0 && base == 10)
	{
		i = val = -value;
		*str++;
	}
	else
	{
		i = val = (unsigned int) value;
	}
	
	do
		*str++;
	while ((i /= base));
	
	*str = '\0';
	
	do
		*--str = itoa_lower_digits[val % base];
	while ((val /= base) != 0);
	
	if (value < 0 && base == 10)
		*--str = '-';
	
	return str;
}

