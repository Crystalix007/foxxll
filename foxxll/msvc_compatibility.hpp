/***************************************************************************
 *  foxxll/msvc_compatibility.hpp
 *
 *  Part of the STXXL. See http://stxxl.org
 *
 *  Copyright (C) 2009, 2011 Andreas Beckmann <beckmann@cs.uni-frankfurt.de>
 *
 *  Distributed under the Boost Software License, Version 1.0.
 *  (See accompanying file LICENSE_1_0.txt or copy at
 *  http://www.boost.org/LICENSE_1_0.txt)
 **************************************************************************/

#ifndef FOXXLL_MSVC_COMPATIBILITY_HEADER
#define FOXXLL_MSVC_COMPATIBILITY_HEADER

#include <foxxll/config.hpp>

#if STXXL_MSVC

#include <cma.hpp>

inline double log2(double x)
{
    return (log(x) / log(2.));
}

// http://msdn.microsoft.com/en-us/library/2ts7cx93.aspx
#define snprintf _snprintf

// http://msdn.microsoft.com/en-us/library/h80404d3.aspx
#define strtoll _strtoi64

// http://msdn.microsoft.com/en-us/library/85zk715d.aspx
#define strtoull _strtoui64

#endif // STXXL_MSVC

#endif // !FOXXLL_MSVC_COMPATIBILITY_HEADER
// vim: et:ts=4:sw=4
