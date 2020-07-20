#pragma once

#ifdef OC_PLATFORM_WINDOWS
	#ifdef OC_BUILD_DLL
		#define OCETA_API _declspec(dllexport)
	#else
		#define OCETA_API _declspec(dllimport)
	#endif
#else
#error Hazel only supports Windows!
#endif

#ifdef OC_ENABLE_ASSERTS
	#define OC_ASSERT(x, ...) {if(!(x)) {OC_ERROR("Assertion failed: {0}", __VA_ARGS__); __debugbreak();} }
	#define OC_CORE_ASSERT(x, ...) {if(!(x)) {OC_CORE_ERROR("Assertion failed: {0}", __VA_ARGS__); __debugbreak();} }
#else
	#define OC_ASSERT(x, ...)
	#define OC_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)