#pragma once

#ifdef OC_PLATFORM_WINDOWS

extern Oceta::Application* Oceta::CreateApplication();

	int main(int argc, char** argv)
	{
		Oceta::Log::Init();
		OC_CORE_CRITICAL("Initialized Log");
		OC_INFO("Hello Log");

		auto app = Oceta::CreateApplication();
		app->Run();
		delete app;
	}

#endif