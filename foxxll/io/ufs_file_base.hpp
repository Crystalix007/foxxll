/***************************************************************************
 *  foxxll/io/ufs_file_base.hpp
 *
 *  UNIX file system file base
 *
 *  Part of FOXXLL. See http://foxxll.org
 *
 *  Copyright (C) 2002 Roman Dementiev <dementiev@mpi-sb.mpg.de>
 *  Copyright (C) 2008 Andreas Beckmann <beckmann@cs.uni-frankfurt.de>
 *  Copyright (C) 2009 Johannes Singler <singler@ira.uka.de>
 *  Copyright (C) 2013 Timo Bingmann <tb@panthema.net>
 *
 *  Distributed under the Boost Software License, Version 1.0.
 *  (See accompanying file LICENSE_1_0.txt or copy at
 *  http://www.boost.org/LICENSE_1_0.txt)
 **************************************************************************/

#ifndef FOXXLL_IO_UFS_FILE_BASE_HEADER
#define FOXXLL_IO_UFS_FILE_BASE_HEADER

#include <mutex>
#include <string>

#include <foxxll/io/file.hpp>

namespace foxxll {

//! \addtogroup foxxll_fileimpl
//! \{

//! Base for UNIX file system implementations.
class ufs_file_base : public virtual file
{
protected:
    std::mutex fd_mutex_; // sequentialize function calls involving file_des_
    int file_des_;        // file descriptor
    int mode_;            // open mode
    const std::string filename_;
    bool is_device_;      //!< is special device node
    ufs_file_base(const std::string& filename, int mode);
    void _after_open();
    offset_type _size();
    void _set_size(offset_type newsize);
    void close();

public:
    ~ufs_file_base();
    offset_type size() final;
    void set_size(offset_type newsize) final;
    void lock() final;
    const char * io_type() const override;
    void close_remove() final;
    //! unlink file without closing it.
    void unlink();
    //! return true if file is special device node
    bool is_device() const;
};

//! \}

} // namespace foxxll

#endif // !FOXXLL_IO_UFS_FILE_BASE_HEADER

/**************************************************************************/
