#define _LIBC_LIMITS_H_	1
#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
   We define this value here since the gcc header does not define
#define MB_LEN_MAX	16
/* If we are not using GNU CC we have to define all the symbols ourself.
#if !defined __GNUC__ || __GNUC__ < 2
#  define _LIMITS_H	1
#  define CHAR_BIT	8
#  define SCHAR_MIN	(-128)
#  define SCHAR_MAX	127
#  define UCHAR_MAX	255
#   define CHAR_MIN	0
#   define CHAR_MAX	UCHAR_MAX
#   define CHAR_MIN	SCHAR_MIN
#   define CHAR_MAX	SCHAR_MAX
#  define SHRT_MIN	(-32768)
#  define SHRT_MAX	32767
#  define USHRT_MAX	65535
#  define INT_MIN	(-INT_MAX - 1)
#  define INT_MAX	2147483647
#  define UINT_MAX	4294967295U
#   define LONG_MAX	9223372036854775807L
#   define LONG_MAX	2147483647L
#  define LONG_MIN	(-LONG_MAX - 1L)
#   define ULONG_MAX	18446744073709551615UL
#   define ULONG_MAX	4294967295UL
#   define LLONG_MAX	9223372036854775807LL
#   define LLONG_MIN	(-LLONG_MAX - 1LL)
#   define ULLONG_MAX	18446744073709551615ULL
 /* Get the compiler's limits.h, which defines almost all the ISO constants.
#if defined __GNUC__ && !defined _GCC_LIMITS_H_
/* `_GCC_LIMITS_H_' is what GCC's file defines.  */
/* The <limits.h> files in some gcc versions don't define LLONG_MIN,
   LLONG_MAX, and ULLONG_MAX.  Instead only the values gcc defined for
#if defined __USE_ISOC99 && defined __GNUC__
#  define LLONG_MIN	(-LLONG_MAX-1)
#  define LLONG_MAX	__LONG_LONG_MAX__
#  define ULLONG_MAX	(LLONG_MAX * 2ULL + 1)
/* The integer width macros are not defined by GCC's <limits.h> before
#  define CHAR_WIDTH 8
#  define SCHAR_WIDTH 8
#  define UCHAR_WIDTH 8
#  define SHRT_WIDTH 16
#  define USHRT_WIDTH 16
#  define INT_WIDTH 32
#  define UINT_WIDTH 32
#  define LONG_WIDTH __WORDSIZE
#  define ULONG_WIDTH __WORDSIZE
#  define LLONG_WIDTH 64
#  define ULLONG_WIDTH 64
