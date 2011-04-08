# -------------------------------------------------
# Project created by QtCreator 2010-02-26T22:34:51
# -------------------------------------------------
TARGET = openEMS
CONFIG += console
CONFIG -= app_bundle qt
TEMPLATE = app
OBJECTS_DIR = obj
INCLUDEPATH += .
INCLUDEPATH += ../CSXCAD \
    ../fparser \
    ../tinyxml
LIBS += -L../CSXCAD -lCSXCAD

###############################################################################
# CONFIG SECTION

# the SSE engine defaults to flush-to-zero mode, because of speed advantages
# to restore the correct handling of denormals and to comply to IEEE 754 uncomment:
# DEFINES += SSE_CORRECT_DENORMALS

# openEMS defaults to output length in unit meters; to recover the old behaviour
# to output length in terms of the drawing unit, uncomment:
# DEFINES += OUTPUT_IN_DRAWINGUNITS

# enable MPI support
!win32:CONFIG += MPI_SUPPORT

# CONFIG SECTION
###############################################################################

win32 {
    INCLUDEPATH += ../hdf5/include ../hdf5/include/cpp ../boost/include/boost-1_42
    LIBS +=  ../hdf5/lib/hdf5_cpp.lib ../hdf5/lib/hdf5.lib
    LIBS += ../boost/lib/libboost_thread-mgw44-mt.lib
    LIBS += -L../CSXCAD/release
    LIBS += ../fparser/release/libfparser4.a
    LIBS += ../tinyxml/release/libtinyxml2.a
}
!win32 {
    LIBS += ../fparser/libfparser.so
    LIBS += ../tinyxml/libtinyxml.so
    LIBS += -lboost_thread
    LIBS += -lhdf5 -lhdf5_cpp
	### vtk ###
    INCLUDEPATH += /usr/include/vtk-5.2 \
        /usr/include/vtk-5.4 \
        /usr/include/vtk-5.6
    LIBS += -lvtkCommon \
        -lvtkIO \
		-lvtksys \
		-lvtkFiltering
}
QMAKE_LFLAGS += \'-Wl,-rpath,\$$ORIGIN/../CSXCAD\'
QMAKE_LFLAGS += \'-Wl,-rpath,\$$ORIGIN/../fparser\'
QMAKE_LFLAGS += \'-Wl,-rpath,\$$ORIGIN/../tinyxml\'

#### SOURCES ################################################################
SOURCES += main.cpp \
	openems.cpp

# FDTD
SOURCES += FDTD/engine.cpp \
    FDTD/operator.cpp \
    FDTD/engine_multithread.cpp \
    FDTD/operator_cylinder.cpp \
    FDTD/engine_sse.cpp \
    FDTD/operator_sse.cpp \
    FDTD/operator_sse_compressed.cpp \
    FDTD/engine_sse_compressed.cpp \
    FDTD/operator_multithread.cpp \
    FDTD/excitation.cpp \
    FDTD/operator_cylindermultigrid.cpp \
    FDTD/engine_cylindermultigrid.cpp \
	FDTD/engine_interface_fdtd.cpp

# FDTD/extensions source files
SOURCES += FDTD/extensions/engine_extension.cpp \
    FDTD/extensions/operator_ext_dispersive.cpp \
    FDTD/extensions/operator_ext_lorentzmaterial.cpp \
    FDTD/extensions/engine_ext_dispersive.cpp \
    FDTD/extensions/engine_ext_lorentzmaterial.cpp \
    FDTD/extensions/operator_ext_pml_sf.cpp \
    FDTD/extensions/engine_ext_pml_sf.cpp \
    FDTD/extensions/engine_ext_cylindermultigrid.cpp \
    FDTD/extensions/operator_ext_upml.cpp \
    FDTD/extensions/engine_ext_upml.cpp \
    FDTD/extensions/operator_extension.cpp \
    FDTD/extensions/engine_ext_mur_abc.cpp \
    FDTD/extensions/operator_ext_mur_abc.cpp \
    FDTD/extensions/operator_ext_cylinder.cpp \
    FDTD/extensions/engine_ext_cylinder.cpp \
    FDTD/extensions/operator_ext_excitation.cpp \
    FDTD/extensions/engine_ext_excitation.cpp

# Common source files
SOURCES += Common/operator_base.cpp \
    Common/engine_interface_base.cpp \
    Common/processmodematch.cpp \
    Common/processvoltage.cpp \
    Common/processing.cpp \
    Common/processintegral.cpp \
    Common/processfields.cpp \
    Common/processfields_td.cpp \
    Common/processcurrent.cpp \
    Common/processfields_fd.cpp \
    Common/processfieldprobe.cpp \
    Common/processfields_sar.cpp

# tools
 SOURCES += tools/global.cpp \
	tools/useful.cpp \
	tools/array_ops.cpp \
	tools/ErrorMsg.cpp \
	tools/AdrOp.cpp \
	tools/vtk_file_io.cpp \
	tools/base_file_io.cpp

#### HEADERS ################################################################
HEADERS += openems.h

# FDTD
HEADERS += FDTD/engine.h \
    FDTD/operator.h \
    FDTD/engine_multithread.h \
    FDTD/operator_cylinder.h \
    FDTD/engine_sse.h \
    FDTD/operator_sse.h \
    FDTD/excitation.h \
    FDTD/operator_sse_compressed.h \
    FDTD/engine_sse_compressed.h \
    FDTD/operator_multithread.h \
    FDTD/operator_cylindermultigrid.h \
    FDTD/engine_cylindermultigrid.h \
	FDTD/engine_interface_fdtd.h

# FDTD/extensions header files
HEADERS += FDTD/extensions/operator_extension.h \
    FDTD/extensions/engine_extension.h \
    FDTD/extensions/engine_ext_mur_abc.h \
    FDTD/extensions/operator_ext_mur_abc.h \
    FDTD/extensions/operator_ext_cylinder.h \
    FDTD/extensions/engine_ext_cylinder.h \
    FDTD/extensions/operator_ext_dispersive.h \
    FDTD/extensions/operator_ext_lorentzmaterial.h \
    FDTD/extensions/engine_ext_dispersive.h \
    FDTD/extensions/engine_ext_lorentzmaterial.h \
    FDTD/extensions/operator_ext_pml_sf.h \
    FDTD/extensions/engine_ext_pml_sf.h \
    FDTD/extensions/engine_ext_cylindermultigrid.h \
    FDTD/extensions/operator_ext_upml.h \
    FDTD/extensions/engine_ext_upml.h \
    FDTD/extensions/operator_ext_excitation.h \
    FDTD/extensions/engine_ext_excitation.h

# Common header files
HEADERS += Common/operator_base.h \
    Common/engine_interface_base.h \
    Common/processvoltage.h \
    Common/processing.h \
    Common/processintegral.h \
    Common/processfields.h \
    Common/processfields_td.h \
    Common/processcurrent.h \
    Common/processmodematch.h \
    Common/processfields_fd.h \
    Common/processfieldprobe.h \
    Common/processfields_sar.h

# tools
HEADERS += tools/ErrorMsg.h \
	tools/AdrOp.h \
	tools/constants.h \
	tools/array_ops.h \
	tools/global.h \
	tools/useful.h \
	tools/aligned_allocator.h \
	tools/vtk_file_io.h \
	tools/base_file_io.h

QMAKE_CXXFLAGS_RELEASE = -O3 \
	-g \
	-march=native
QMAKE_CXXFLAGS_DEBUG = -O0 \
	-g \
	-march=native

MPI_SUPPORT {
	DEFINES += MPI_SUPPORT
	INCLUDEPATH += /usr/include/mpi
	LIBS += -lmpi -lmpi++
    HEADERS += FDTD/operator_mpi.h \
		FDTD/engine_mpi.h \
	FDTD/openems_fdtd_mpi.h
    SOURCES += FDTD/operator_mpi.cpp \
		FDTD/engine_mpi.cpp \
		FDTD/openems_fdtd_mpi.cpp

	QMAKE_CXXFLAGS_RELEASE += -Wno-unused-parameter #needed because mpich2 produces tons of unused parameter
}

# add git revision
QMAKE_CXXFLAGS += -DGIT_VERSION=\\\"`git describe --tags`\\\"

# to use ABI2 target:
# qmake CONFIG+="ABI2 bits64" -o Makefile.ABI2-64 openEMS.pro
# make -fMakefile.ABI2-64
ABI2 { 
    CONFIG -= debug \
        debug_and_release
    CONFIG += release
    QMAKE_CFLAGS_RELEASE = -O2 \
        -fabi-version=2
    QMAKE_CXXFLAGS_RELEASE = -O2 \
        -fabi-version=2
    QMAKE_CC = apgcc
    QMAKE_CXX = apg++
    QMAKE_LINK = apg++
    QMAKE_LINK_SHLIB = apg++
    QMAKE_LFLAGS_RPATH = 
    QMAKE_LFLAGS = \'-Wl,-rpath,\$$ORIGIN/lib\'
}
bits64 { 
    QMAKE_CXXFLAGS_RELEASE += -m64 \
        -march=athlon64
    QMAKE_LFLAGS_RELEASE += -m64 \
        -march=athlon64
    OBJECTS_DIR = ABI2-64
    LIBS = ../CSXCAD/ABI2-64/libCSXCAD.so
    LIBS += ../fparser/ABI2-64/libfparser.so
    LIBS += ../tinyxml/ABI2-64/libtinyxml.so
    LIBS += ../boost-64/lib/libboost_thread.so
    LIBS += ../hdf5-64/lib/libhdf5.so
    LIBS += ../hdf5-64/lib/libhdf5_cpp.so \
        -lpthread
    INCLUDEPATH += ../hdf5-64/include
    INCLUDEPATH += ../boost-64/include
}
bits32 { 
    QMAKE_CXXFLAGS_RELEASE += -m32 \
		-march=pentium3
    QMAKE_LFLAGS_RELEASE += -m32 \
		-march=pentium3
    OBJECTS_DIR = ABI2-32
    LIBS = ../CSXCAD/ABI2-32/libCSXCAD.so
    LIBS += ../fparser/ABI2-32/libfparser.so
    LIBS += ../tinyxml/ABI2-32/libtinyxml.so
    LIBS += ../boost-32/lib/libboost_thread.so
    LIBS += ../hdf5-32/lib/libhdf5.so
    LIBS += ../hdf5-32/lib/libhdf5_cpp.so
    INCLUDEPATH += ../hdf5-32/include
    INCLUDEPATH += ../boost-32/include
}
ABI2 { 
    DESTDIR = $$OBJECTS_DIR
    MOC_DIR = $$OBJECTS_DIR
    UI_DIR = $$OBJECTS_DIR
    RCC_DIR = $$OBJECTS_DIR
}
