#pragma once

#include <memory>

#include "Core.h"
#include "spdlog\spdlog.h"

namespace Oceta {
	class OCETA_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger;  }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

#define OC_CORE_TRACE(...)		::Oceta::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define OC_CORE_INFO(...)			::Oceta::Log::GetCoreLogger()->info(__VA_ARGS__)
#define OC_CORE_WARN(...)		::Oceta::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define OC_CORE_ERROR(...)		::Oceta::Log::GetCoreLogger()->error(__VA_ARGS__)
#define OC_CORE_FATAL(...)		::Oceta::Log::GetCoreLogger()->critical(__VA_ARGS__)

#define OC_APP_TRACE(...)			::Oceta::Log::GetClientLogger()->trace(__VA_ARGS__)
#define OC_APP_INFO(...)			::Oceta::Log::GetClientLogger()->info(__VA_ARGS__)
#define OC_APP_WARN(...)			::Oceta::Log::GetClientLogger()->warn(__VA_ARGS__)
#define OC_APP_ERROR(...)			::Oceta::Log::GetClientLogger()->error(__VA_ARGS__)
#define OC_APP_FATAL(...)			::Oceta::Log::GetClientLogger()->critical(__VA_ARGS__)

