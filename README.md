# Roblox Module-Loader Model
This is a Roblox Module-loader, made to work like the default ServiceProvider,  
as well as making module managent easier

<img src="Images/ModuleLoader.png" height="200" width="200"></img>

__This ModuleLoader works like this:__

> - Put the ModuleLoader folder on ReplicatedStorage;
> - Put all your modules that you want to access on the "\Services" folder;
> - Now, add a attributte on your module called: "ServiceRunType";
> - This can be "Global", "Server" or "Client".

__To require the modules you just need to do:__

__*On a regular script*__
> - Require the ModuleLoader, with require(game.ReplicatedStorage...);
> - Do ModuleLoader:FetchAllServices();
> - Do ModuleLoader:GetService(ServiceName)

__*On a module inside the Services folder*__
> - Create a method called "Module:Init()";
> - Then, inside of it declare "Module.Service = Moduleloader:GetService(ServiceName)";
> - And for using, do "Module.Service.Method"
