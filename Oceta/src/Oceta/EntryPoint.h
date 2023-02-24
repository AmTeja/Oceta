#pragma once

#ifdef OC_PLATFROM_WIDNOWS

extern Oceta::Application* Oceta::CreateApplication();

int main(int argc, char** argv)
{
    auto app = Oceta::CreateApplication();
    app->Run();
    delete app;
}

#else
#error Oceta is only available on Windows!
#endif