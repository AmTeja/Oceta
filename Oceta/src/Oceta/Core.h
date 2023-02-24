#pragma once

#ifdef OC_PLATFROM_WIDNOWS
    #ifdef OC_BUILD_DLL
	    #define OCETA_API __declspec(dllexport)
    #else
	    #define OCETA_API __declspec(dllimport)
    #endif
#else
    #error Oceta is only available on Windows!
#endif