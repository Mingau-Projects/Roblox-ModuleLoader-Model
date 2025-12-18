# Roblox-ModuleLoader-Model
This is a Roblox Module-loader, made to work like the default ServiceProvider

__This ModuleLoader works like this:__

> - Put all your modules that you want to access on the "\Services" folder;
> - Now, add a attributte on your module called: "ServiceRunType";
> - This can be "Global", "Server" or "Client";

__To require the modules you just need to do__

*On a regular script*
- Require the ModuleLoader
- Do ModuleLoader:FetchAllServices()
- Do ModuleLoader:GetService(ServiceName)

*On a module inside the Services folder*
- Create a method called "Module:Init()";
- Then, inside of it declare "Module.Service = Moduleloader:GetService(ServiceName)";
- And for using, do "Module.Service.Method"
