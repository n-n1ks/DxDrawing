--[[
|	** File:		CDxObject.lua
|	** Type:		Client
|	** Author: 		N1kS
|	** Discription:	DxObject content
]]

CDxObject = {};

function CDxObject:init()
	self.m_Childs = {};
	if self.m_Parent then
		self.m_Parent:addChild( self )
	end
	-- Default events for our object
	if self.m_X and self.m_Y and self.m_Width and self.m_Height then
		self.m_FunctionOnClick = bind( CDxObject.onClick, self );
		addEventHandler( "onClientClick", root, self.m_FunctionOnClick );
		
		self.m_MouseEntered = false;
		
		self.m_FunctionMouseMove = bind( CDxObject.onMouseMove, self );
		addEventHandler( "onClientCursorMove", root, self.m_FunctionMouseMove );
	end
end

function CDxObject:destroy()
	if self.m_FunctionOnClick then
		removeEventHandler( "onClientClick", root, self.m_FunctionOnClick );
	end
	if self.m_FunctionMouseMove then
		removeEventHandler( "onClientCursorMove", root, self.m_FunctionMouseMove );
	end
	Dx:deleteElement( self.m_Type, self.m_ID );
	for _, Child in ipairs( self.m_Childs ) do
		Child:destroy();
	end
	delete( self );
end

function CDxObject:addChild( Child )
	table.insert( self.m_Childs, Child );
end

function CDxObject:getChilds()
	return self.m_Childs;
end

function CDxObject:setX( X )
	if tonumber( X ) and self.m_X then
		self.m_X = X;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getX()
	return self.m_X or false;
end

function CDxObject:setXTo( X )
	if tonumber( X ) and self.m_XTo then
		self.m_XTo = X;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getXTo()
	return self.m_XTo or alse;
end

function CDxObject:setY( Y )
	if tonumber( Y ) and self.m_Y then
		self.m_Y = Y;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getY()
	return self.m_Y or false;
end

function CDxObject:setYTo( Y )
	if tonumber( Y ) and self.m_YTo then
		self.m_YTo = Y;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getYTo()
	return seself.m_YTo or false;
end

function CDxObject:setWidth( Width )
	if tonumber( Width ) and self.m_Width then
		self.m_Width = Width;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getWidth()
	return self.m_Width or false;
end

function CDxObject:setHeight( Height )
	if tonumber( Height ) and self.m_Height then
		self.m_Height = Height;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getHeight()
	return self.m_Height or false;
end

function CDxObject:setColor( Color )
	if type( Color ) == "table" and self.m_Color then
		for Index, Number in ipairs( Color ) do
			if not tonumber( Number ) or ( Number < 1 and Number > 255 ) then
				outputDebugString( "Incorrect value!", 1 );
				return
			end
		end
		self.m_Color = Color;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getColor()
	return self.m_Color or false;
end

function CDxObject:setAlpha( Alpha )
	if tonumber( Alpha ) and self.m_Alpha and Alpha > 1 and Alpha < 255 then
		self.m_Alpha = Alpha;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getAlpha()
	return self.m_Alpha or false;
end

function CDxObject:setParrent( Parent )
	self.m_Parent = Parent;
end

function CDxObject:getParent()
	return self.m_Parent;
end

function CDxObject:setPosition( Horizontal, Vertical )
	local X, Y = guiGetScreenSize();
	-- For line;
	if self.m_Type == "Line" then
		local LineWidth = self.m_XTo - self.m_X;
		local LineHeight = self.m_YTo - self.m_Y;
		if Horizontal then
			if Horizontal == "left" then
				self.m_X = 0;
				self.m_XTo = LineWidth;
			elseif Horizontal == "center" then
				self.m_X = ( X/2 ) - ( LineWidth/2 );
				self.m_XTo = self.m_X + LineWidth;
			elseif Horizontal == "right" then
				self.m_XTo = X;
				self.m_X = X - LineWidth;
			end
		end
		if Vertical then
			if Vertical == "top" then
				self.m_Y = 0;
				self.m_YTo = LineHeight;
			elseif Vertical == "center" then
				self.m_Y = ( Y/2 ) - ( LineHeight/2 );
				self.m_YTo = self.m_Y + LineHeight;
			elseif Vertical == "bottom" then
				self.m_YTo = Y;
				self.m_Y = Y - LineHeight;
			end
		end
		return
	end
	-- For Text;
	if self.m_Type == "Text" then
		if Horizontal then
			self.m_AlignX = Horizontal;
		end
		if Vertical then
			self.m_AlignY = Vertical;
		end
		return;
	end
	-- For image and rectangle;
	if Horizontal then
		if Horizontal == "left" then
			self.m_X = 0;
		elseif Horizontal == "center" then
			self.m_X = ( X/2 ) - ( self.m_Width/2 );
		elseif Horizontal == "right" then
			self.m_X = X - self.m_Width;
		end
	end
	if Vertical then
		if Vertical == "top" then
			self.m_Y = 0;
		elseif Vertical == "center" then
			self.m_Y = ( Y/2 ) - ( self.m_Height/2 );
		elseif Vertical == "bottom" then
			self.m_Y = Y - self.m_Height;
		end
	end
end

function CDxObject:setImage( Image )
	if self.m_Image then
		self.m_Image = Image;
	end
end

function CDxObject:getImage()
	return self.m_Image or false;
end

function CDxObject:setU( U )
	if self.m_U and tonumber( U ) then
		self.m_U = U;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getU()
	return self.m_U or false;
end

function CDxObject:setUSize( USize )
	if self.m_USize and tonumber( USize ) then
		self.m_USize = USize;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getUSize()
	return self.m_USiz or false;
end

function CDxObject:setV( V )
	if self.m_V and tonumber( V ) then
		self.m_V = V
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getV()
	return self.m_V or false;
end

function CDxObject:setVSize( VSize )
	if self.m_VSize and tonumber( VSize ) then
		self.m_VSize = VSize;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getVSize()
	if self.m_VSize then
		return self.m_VSize;
	end
	return false;
end

function CDxObject:setScale( Scale )
	if self.m_Scale and tonumber( Scale ) then
		self.m_Scale = Scale;
	else
		outputDebugString( "Incorrect value!", 1 );
	end
end

function CDxObject:getScale()
	return self.m_Scale or false;
end

function CDxObject:setFont( Font )
	if self.m_Font then
		self.m_Font = Font;
	end
end

function CDxObject:getFont()
	return self.m_Font or false;
end

function CDxObject:setClip( Clip )
	if type( self.m_Clip ) ~= "nil" then
		self.m_Clip = Clip;
	end
end

function CDxObject:getClip()
	return self.m_Clip or false;
end

function CDxObject:setWordBreak( WordBreak )
	if type( self.m_WordBreak) ~= "nil" then
		self.m_WordBreak = WordBreak
	end
end

function CDxObject:getWordBreak()
	return self.m_WordBreak or false;
end

function CDxObject:setColorCoded( ColorCoded )
	if type( self.m_ColorCoded ) ~= "nil" then
		self.m_ColorCoded = ColorCoded
	end
end

function CDxObject:getColorCoded()
	return self.m_ColorCoded or false;
end 

function CDxObject:getType()
	return self.m_Type;
end

function CDxObject:onClick( Button, State, X, Y )
	if self.OnClick then
		if X >= self.m_X and X <= self.m_X + self.m_Width and Y > self.m_Y and Y < self.m_Y + self.m_Height then
			self.OnClick( Button, State );
		end
	end
end

function CDxObject:onMouseMove( _, _, X, Y )
	if X >= self.m_X and X <= self.m_X + self.m_Width and Y >= self.m_Y and Y <= self.m_Y + self.m_Height then
		if self.OnMouseEnter and not self.m_MouseEntered then
			self.OnMouseEnter( true );
			self.m_MouseEntered = true;
		end
	else
		if self.OnMouseLeave and self.m_MouseEntered then
			self.OnMouseLeave( true );
			self.m_MouseEntered = false;
		end
	end
end