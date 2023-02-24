#pragma once

#ifdef OC_PLATFROM_WIDNOWS

extern Oceta::Application* Oceta::CreateApplication();

int main(int argc, char** argv)
{
    Oceta::Log::Init();
    OC_CORE_WARN("Logger Initialized!");
    OC_APP_TRACE("Logger Initialized!");
    
    auto app = Oceta::CreateApplication();
    app->Run();
    delete app;
}

#else
#error Oceta is only available on Windows!
#endif