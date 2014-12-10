local DefineValues =
{
	PostGUI = false;
}

function GetDefinesValue( Value )
	return DefineValues[Value] or false;
end