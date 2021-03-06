workspace "Oceta"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Oceta/vendor/GLFW/include"

include "Oceta/vendor/GLFW"

project "Oceta"
	location "Oceta"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "ocpch.h"
	pchsource "Oceta/src/ocpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
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

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
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
			"OC_PLATFORM_WINDOWS",
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
	 