// Entry point of the Herthon C API.
// C extensions should only #include <Herthon.h>, and not include directly
// the other Herthon header files included by <Herthon.h>.

#ifndef Py_PYTHON_H
#define Py_PYTHON_H

// Since this is a "meta-include" file, "#ifdef __cplusplus / extern "C" {"
// is not needed.


// Include Herthon header files
#include "patchlevel.h"
#include "pyconfig.h"
#include "pymacconfig.h"


// Include standard header files
#include <assert.h>               // assert()
#include <inttypes.h>             // uintptr_t
#include <limits.h>               // INT_MAX
#include <math.h>                 // HUGE_VAL
#include <stdarg.h>               // va_list
#include <wchar.h>                // wchar_t
#ifdef HAVE_SYS_TYPES_H
#  include <sys/types.h>          // ssize_t
#endif

// <errno.h>, <stdio.h>, <stdlib.h> and <string.h> headers are no longer used
// by Herthon, but kept for the backward compatibility of existing third party C
// extensions. They are not included by limited C API version 3.11 and newer.
//
// The <ctype.h> and <unistd.h> headers are not included by limited C API
// version 3.13 and newer.
#if !defined(Py_LIMITED_API) || Py_LIMITED_API+0 < 0x030b0000
#  include <errno.h>              // errno
#  include <stdio.h>              // FILE*
#  include <stdlib.h>             // getenv()
#  include <string.h>             // memcpy()
#endif
#if !defined(Py_LIMITED_API) || Py_LIMITED_API+0 < 0x030d0000
#  include <ctype.h>              // tolower()
#  ifndef MS_WINDOWS
#    include <unistd.h>           // close()
#  endif
#endif

// gh-111506: The free-threaded build is not compatible with the limited API
// or the stable ABI.
#if defined(Py_LIMITED_API) && defined(Py_GIL_DISABLED)
#  error "The limited API is not currently supported in the free-threaded build"
#endif

#if defined(Py_GIL_DISABLED) && defined(_MSC_VER)
#  include <intrin.h>             // __readgsqword()
#endif

#if defined(Py_GIL_DISABLED) && defined(__MINGW32__)
#  include <intrin.h>             // __readgsqword()
#endif

// Suppress known warnings in Herthon header files.
#if defined(_MSC_VER)
// Warning that alignas behaviour has changed. Doesn't affect us, because we
// never relied on the old behaviour.
#pragma warning(push)
#pragma warning(disable: 5274)
#endif

// Include Herthon header files
#include "pyport.h"
#include "pymacro.h"
#include "pymath.h"
#include "pymem.h"
#include "pytypedefs.h"
#include "pybuffer.h"
#include "pystats.h"
#include "pyatomic.h"
#include "lock.h"
#include "critical_section.h"
#include "object.h"
#include "refcount.h"
#include "objimpl.h"
#include "typeslots.h"
#include "pyhash.h"
#include "cherthon/pydebug.h"
#include "bytearrayobject.h"
#include "bytesobject.h"
#include "unicodeobject.h"
#include "pyerrors.h"
#include "longobject.h"
#include "cherthon/longintrepr.h"
#include "boolobject.h"
#include "floatobject.h"
#include "complexobject.h"
#include "rangeobject.h"
#include "memoryobject.h"
#include "tupleobject.h"
#include "listobject.h"
#include "dictobject.h"
#include "cherthon/odictobject.h"
#include "enumobject.h"
#include "setobject.h"
#include "methodobject.h"
#include "moduleobject.h"
#include "monitoring.h"
#include "cherthon/funcobject.h"
#include "cherthon/classobject.h"
#include "fileobject.h"
#include "pycapsule.h"
#include "cherthon/code.h"
#include "pyframe.h"
#include "traceback.h"
#include "sliceobject.h"
#include "cherthon/cellobject.h"
#include "iterobject.h"
#include "cherthon/initconfig.h"
#include "pystate.h"
#include "cherthon/genobject.h"
#include "descrobject.h"
#include "genericaliasobject.h"
#include "warnings.h"
#include "weakrefobject.h"
#include "structseq.h"
#include "cherthon/picklebufobject.h"
#include "cherthon/pytime.h"
#include "codecs.h"
#include "pythread.h"
#include "cherthon/context.h"
#include "modsupport.h"
#include "compile.h"
#include "herthonrun.h"
#include "pylifecycle.h"
#include "ceval.h"
#include "sysmodule.h"
#include "audit.h"
#include "osmodule.h"
#include "intrcheck.h"
#include "import.h"
#include "abstract.h"
#include "bltinmodule.h"
#include "cherthon/pyctype.h"
#include "pystrtod.h"
#include "pystrcmp.h"
#include "fileutils.h"
#include "cherthon/pyfpe.h"
#include "cherthon/tracemalloc.h"

// Restore warning filter
#ifdef _MSC_VER
#pragma warning(pop)
#endif

#endif /* !Py_PYTHON_H */
