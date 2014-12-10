CImageSection = inherit( CDxObject );

function CImageSection:constructor( X, Y, Width, Height, U, V, USize, VSize, Image, Rotation, RotationOffsetX, RotationOffsetY, Color, Alpha, Parent )
	self.m_X = X;
	self.m_Y = Y;
	if Parent then
		self.m_X = self.m_X + Parent.m_X;
		self.m_Y = self.m_Y + Parent.m_Y;
	end
	self.m_Width = Width;
	self.m_Height = Height;
	self.m_U = U;
	self.m_V = V;
	self.m_USize = USize;
	self.m_VSize = VSize;
	self.m_Image = Image;
	self.m_Rotation = Rotation or 0;
	self.m_RotationOffsetX = RotationOffsetX or 0;
	self.m_RotationOffsetY = RotationOffsetY or 0;
	self.m_Color = Color or { 255, 255, 255 };
	self.m_Alpha = Alpha or 255;
	self.m_Parent = Parent or false;
	self.m_Type = "ImageSection";
	self:init();
	self.m_FunctionRender = bind( CImageSection.onRender, self );
	addEventHandler( "onClientRender", root, self.m_FunctionRender );
end

function CImageSection:destructor()
	if self.m_FunctionRender then
		removeEventHandler( "onClientRender", root, self.m_FunctionRender );
	end
end

function CImageSection:onRender()
	dxDrawImageSection( self.m_X, self.m_Y, self.m_Width, self.m_Height, self.m_U, self.m_V, self.m_USize, self.m_VSize, self.m_Image, self.m_Rotation, self.m_RotationOffsetX, self.m_RotationOffsetY, tocolor( self.m_Color[1], self.m_Color[2], self.m_Color[3], self.m_Alpha ), GetDefinesValue( "PostGUI" ) );
end