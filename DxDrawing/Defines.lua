--[[
|	** File:		Defines.lua
|	** Type:		Client
|	** Author: 		N1kS
|	** Discription:	Dx defines
]]

local DefineValues =
{
	PostGUI = false;
}

function GetDefinesValue( Value )
	return DefineValues[Value] or false;
end