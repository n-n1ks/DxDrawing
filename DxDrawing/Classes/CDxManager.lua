CDxManager = {};

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		Dx = new( CDxManager );
	end
)

function CDxManager:constructor()
	self.m_Images = {};
	self.m_SectionImages = {};
	self.m_Rectangles = {};
	self.m_Lines = {};
	self.m_Texts = {};
end

function CDxManager:addElement( ElementType, Element )
	if ElementType == "Rectangle" then
		table.insert( self.m_Rectangles, Element );
	elseif ElementType == "Image" then
		table.insert( self.m_Images, Element );
	elseif ElementType == "ImageSection" then
		table.insert( self.m_SectionImages, Element );
	elseif ElementType == "Line" then
		table.insert( self.m_Lines, Element );
	elseif ElementType == "Text" then
		table.insert( self.m_Texts, Element );
	end
end

function CDxManager:deleteElement( ElementType, Index )
	if ElementType == "Rectangle" then
		table.remove( self.m_Rectangles, Index );
	elseif ElementType == "Image" then
		table.remove( self.m_Images, Index );
	elseif ElementType == "ImageSection" then
		table.remove( self.m_SectionImages, Index );
	elseif ElementType == "Line" then
		table.remove( self.m_Lines, Index );
	elseif ElementType == "Text" then
		table.remove( self.m_Texts, Index );
	end
end

function CDxManager:getElementsByType( ElementType )
	if ElementType == "Rectangle" then
		return self.m_Rectangles;
	elseif ElementType == "Image" then
		return self.m_Images;
	elseif ElementType == "ImageSection" then
		return self.m_SectionImages;
	elseif ElementType == "Line" then
		return self.m_Lines;
	elseif ElementType == "Text" then
		return self.m_Texts;
	end
	return false;
end

function CDxManager:createRectangle( X, Y, Width, Height, Color, Alpha, Parent )
	local Rectangle = new( CRectangle, X, Y, Width, Height, Color, Alpha, Paren );
	if Rectangle then
		self:addElement( "Rectangle", Rectangle );
		local ID = #self.m_Rectangles;
		Rectangle.m_ID = ID;
		return Rectangle;
	end
	return false;
end

function CDxManager:createImage( X, Y, Width, Height, Image, Rotation, RotationOffsetX, RotationOffsetY, Color, Alpha, Parent )
	local Image = new( CImage, X, Y, Width, Height, Image, Rotation, RotationOffsetX, RotationOffsetY, Color, Alpha, Parent );
	if Image then
		self:addElement( "Image", Image );
		local ID = #self.m_Images;
		Image.m_ID = ID;
		return Image;
	end
	return false;
end

function CDxManager:createImageSection( X, Y, Width, Height, U, V, USize, VSize, Image, Rotation, RotationOffsetX, RotationOffsetY, Color, Alpha, Parent )
	local Image = new( CImageSection, X, Y, Width, Height, U, V, USize, VSize, Image, Rotation, RotationOffsetX, RotationOffsetY, Color, Alpha, Parent );
	if Image then
		self:addElement( "ImageSection", Image );
		local ID = #self.m_SectionImages;
		Image.m_ID = ID;
		return Image;
	end
	return false;
end

function CDxManager:createLine( X, Y, XTo, YTo, Color, Alpha, Width, Parent )
	local Line = new( CLine, X, Y, XTo, YTo, Color, Alpha, Width, Parent );
	if Line then
		self:addElement( "Line", Line );
		local ID = #self.m_Lines;
		Line.m_ID = ID;
		return Line;
	end
	return false;
end

function CDxManager:createText( Text, X, Y, Width, Height, Color, Alpha, Scale, Font, AlignX, AlignY, Clip, WordBreak, ColorCoded, Parent )
	local Text = new( CText, Text, X, Y, Width, Height, Color, Alpha, Scale, Font, AlignX, AlignY, Clip, WordBreak, ColorCoded, Parent );
	if Text then
		self:addElement( "Text", Text );
		local ID = #self.m_Texts;
		Text.m_ID = ID;
		return Text;
	end
	return false;
end