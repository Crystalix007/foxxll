# Change this file according to your paths

# change to make or gmake
MAKE = make
# change to the name of your compiler
COMPILER = g++-3.3 # we support only g++ >= 3.2

# change this path
STXXL_ROOT = /home/rdementi/projects/stxxl


COMMON_FILES = ../common/aligned_alloc.h  ../common/mutex.h    ../common/perm.h  \
../common/rand.h    ../common/semaphore.h      ../common/state.h   ../common/timer.h \
../common/utils.h ../common/gprof.h ../common/rwlock.h  ../common/simple_vector.h  \
../common/switch.h  ../common/tmeta.h ../compiler.make

IO_LAYER_FILES = ../io/completion_handler.h  ../io/io.h  ../io/iobase.h  \
 ../io/iostats.h  ../io/mmap_file.h  ../io/simdisk_file.h  ../io/syscall_file.h  \
 ../io/ufs_file.h

MNG_LAYER_FILES = ../mng/adaptor.h  ../mng/async_schedule.h  ../mng/block_prefetcher.h \
../mng/buf_istream.h  ../mng/buf_ostream.h  ../mng/buf_writer.h  ../mng/mng.h \
../mng/write_pool.h ../mng/prefetch_pool.h

CONTAINER_FILES = ../containers/pager.h  ../containers/stack.h  ../containers/vector.h \
../containers/priority_queue.h

ALGO_FILES = ../algo/adaptor.h ../algo/inmemsort.h ../algo/intksort.h ../algo/run_cursor.h \
../algo/sort.h ../algo/async_schedule.h ../algo/interleaved_alloc.h ../algo/ksort.h \
../algo/loosertree.h ../algo/scan.h ../algo/stable_ksort.h

STREAM_FILES = ../stream/stream.h ../stream/sort_stream.h

STXXL_SPECIFIC = -DSORT_OPT_PREFETCHING -DUSE_MALLOC_LOCK
LARGE_FILE = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
NO_OVR = #  -DNO_OVERLAPPING
PROF = # -DSTXXL_THREAD_PROFILING -pg
OPT = # -O6
DEBUG = -g # -DNDEBUG #-g # -DNDEBUG # -g # -DSTXXL_VERBOSE_LEVEL=3 
DEBUG = # -DNDEBUG #-g # -DNDEBUG # -g # -DSTXXL_VERBOSE_LEVEL=3 

# this variable is used internally for development compilations
GCC=$(COMPILER) -Wall $(LARGE_FILE) $(NO_OVR) $(OPT) $(PROF) $(DEBUG) $(STXXL_SPECIFIC) # -ftemplate-depth-65000


STXXL_LIB = -lpthread -lstxxl -L$(STXXL_ROOT)/io/
STXXL_OBJ = $(STXXL_LIB)


# put variable STXXL_VARS as a g++ parameter when you compile code 
# that uses stxxl
# for example: g++ external_MST.cpp -o MST $(STXXL_VARS)
STXXL_VARS = $(STXXL_SPECIFIC) $(LARGE_FILE) $(STXXL_LIB) -ftemplate-depth-65000

#
# for automatical checking of order of the pipelined sorters
# use -DSTXXL_CHECK_ORDER_IN_SORTS compile option
#

