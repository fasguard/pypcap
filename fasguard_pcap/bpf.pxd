#
# bpf.pxd
#
# $Id$

"""BPF library

This module provides utilities for working with BPF programs.
"""

__author__ = 'Bruce M. Simpson <bms@incunabulum.net>'
__maintainer__ = 'BBN FASGuard Team <fasguard@bbn.com>'
__copyright__ = 'Copyright (c) 2008 Bruce M. Simpson'
__license__ = 'BSD license'
__url__ = 'https://fasguard.github.io/'
__version__ = '1.0'
__revison__ = '0'

import sys

cdef extern from "pcap/pcap.h":
    struct bpf_insn:
        unsigned short code
        unsigned char jt
        unsigned char jf
        unsigned int k
    struct bpf_program:
        unsigned int bf_len
        bpf_insn *bf_insns
    struct bpf_timeval:
        unsigned int tv_sec
        unsigned int tv_usec

cdef class progbuf:
    cdef bpf_program bp
    cdef bpf_program *__bpf_program__(self)

cdef class program:
    cdef list insns
    cdef object progbuf
    cdef __progbuf__(self)
