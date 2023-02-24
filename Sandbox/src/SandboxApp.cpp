#include <Oceta.h>
class Sandbox : public Oceta::Application
{
public:
    Sandbox()
    {

    }

    ~Sandbox()
    {

    }
};

Oceta::Application* Oceta::CreateApplication()
{
    return new Sandbox();
}