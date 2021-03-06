# This file contains common code for linking against MetaSMT
#
# Consume flags generated by metaSMT here.
ifeq ($(ENABLE_METASMT),1)
  include $(METASMT_ROOT)/share/metaSMT/metaSMT.makefile
  LD.Flags += $(metaSMT_LDFLAGS)
  CXX.Flags += -DMETASMT_DEFAULT_BACKEND_IS_$(METASMT_DEFAULT_BACKEND)
  CXX.Flags += $(metaSMT_CXXFLAGS)
  CXX.Flags += $(metaSMT_INCLUDES)
  CXX.Flags := $(filter-out -fno-exceptions,$(CXX.Flags))
  CXX.Flags := $(filter-out -fno-rtti,$(CXX.Flags))
  LIBS += $(metaSMT_LDLIBS)
endif
