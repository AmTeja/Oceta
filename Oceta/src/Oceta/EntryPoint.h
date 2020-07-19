#pragma once

#ifdef OC_PLATFORM_WINDOWS

extern Oceta::Application* Oceta::CreateApplication();

	int main(int argc, char** argv)
	{
		printf("Oceta Engine");
		auto app = Oceta::CreateApplication();
		app->Run();
		delete app;
	}

#endif