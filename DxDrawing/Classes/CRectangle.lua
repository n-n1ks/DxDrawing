CRectangle = inherit( CDxObject );

function CRectangle:constructor( X, Y, Width, Height, Color, Alpha, Parent )
	self.m_X = X;
	self.m_Y = Y;
	if Parent then
		self.m_X = self.m_X + Parent.m_X;
		self.m_Y = self.m_Y + Parent.m_Y;
	end
	self.m_Width = Width;
	self.m_Height = Height;
	self.m_Color = Color;
	self.m_Alpha = Alpha;
	self.m_Parent = Parent or false;
	self.m_Type = "Rectangle";
	self:init();
	self.m_FunctionRender = bind( CRectangle.onRender, self );
	addEventHandler( "onClientRender", root, self.m_FunctionRender );
end

function CRectangle:destructor()
	if self.m_FunctionRender then
		removeEventHandler( "onClientRender", root, self.m_FunctionRender );
	end
end

function CRectangle:onRender()
	dxDrawRectangle( self.m_X, self.m_Y, self.m_Width, self.m_Height, tocolor( self.m_Color[1], self.m_Color[2], self.m_Color[3], self.m_Alpha ), GetDefinesValue( "PostGUI" ) );
end