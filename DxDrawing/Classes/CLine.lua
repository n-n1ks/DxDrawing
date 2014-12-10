CLine = inherit( CDxObject );

function CLine:constructor( X, Y, XTo, YTo, Color, Alpha, Width, Parent )
	self.m_X = X;
	self.m_Y = Y;
	self.m_XTo = XTo;
	self.m_YTo = YTo;
	if Parent then
		self.m_X = self.m_X + Parent.m_X;
		self.m_Y = self.m_Y + Parent.m_Y;
		self.m_XTo = self.m_XTo + Parent.m_X;
		self.m_YTo = self.m_YTo + Parent.m_Y;
	end
	
	self.m_Color = Color;
	self.m_Alpha = Alpha;
	self.m_Width = Width or 1;
	self.m_Parent = Parent or false;
	self.m_Type = "Line";
	self:init();
	self.m_FunctionRender = bind( CLine.onRender, self );
	addEventHandler( "onClientRender", root, self.m_FunctionRender );
end

function CLine:destructor()
	if self.m_FunctionRender then
		removeEventHandler( "onClientRender", root, self.m_FunctionRender );
	end
end

function CLine:onRender()
	dxDrawLine( self.m_X, self.m_Y, self.m_XTo, self.m_YTo, tocolor( self.m_Color[1], self.m_Color[2], self.m_Color[3], self.m_Alpha ), self.m_Width, GetDefinesValue( "PostGUI" ) );
end