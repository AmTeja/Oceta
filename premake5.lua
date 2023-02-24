workspace "Oceta"
    architecture "x64"
    configurations { "Debug", "Release", "Dist" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Oceta"
    location "Oceta"
    kind "SharedLib"
    language "C++"

    target dir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir dir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "${prj.name}/src/**.h",
        "${prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "OC_PLATFORM_WINDOWS",
            "OC_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }
    
    filter "configurations:Debug"
        defines "OC_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "OC_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "OC_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    target dir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir dir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "${prj.name}/src/**.h",
        "${prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Oceta/vendor/spdlog/include",
        "Oceta/src"
    }

    links
    {
        "Oceta"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "OC_PLATFORM_WINDOWS"
        }
    
    filter "configurations:Debug"
        defines "OC_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "OC_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "OC_DIST"
        optimize "On"