CImage = inherit( CDxObject );

function CImage:constructor( X, Y, Width, Height, Image, Rotation, RotationOffsetX, RotationOffsetY, Color, Alpha, Parent )
	self.m_X = X;
	self.m_Y = Y;
	if Parent then
		self.m_X = self.m_X + Parent.m_X;
		self.m_Y = self.m_Y + Parent.m_Y;
	end
	self.m_Width = Width;
	self.m_Height = Height;
	self.m_Image = Image;
	self.m_Rotation = Rotation or 0;
	self.m_RotationOffsetX = RotationOffsetX or 0;
	self.m_RotationOffsetY = RotationOffsetY or 0;
	self.m_Color = Color or { 255, 255, 255 };
	self.m_Alpha = Alpha or 255;
	self.m_Parent = Parent or false;
	self.m_Type = "Image";
	self:init();
	self.m_FunctionRender = bind( CImage.onRender, self );
	addEventHandler( "onClientRender", root, self.m_FunctionRender );
end

function CImage:destructor()
	if self.m_FunctionRender then
		removeEventHandler( "onClientRender", root, self.m_FunctionRender );
	end
end

function CImage:onRender()
	dxDrawImage( self.m_X, self.m_Y, self.m_Width, self.m_Height, self.m_Image, self.m_Rotation, self.m_RotationOffsetX, self.m_RotationOffsetY, tocolor( self.m_Color[1], self.m_Color[2], self.m_Color[3], self.m_Alpha ), GetDefinesValue( "PostGUI" ) );
end