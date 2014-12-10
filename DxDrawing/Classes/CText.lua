--[[
|	** File:		CText.lua
|	** Type:		Client
|	** Author: 		N1kS
|	** Discription:	DxText content
]]

CText = inherit( CDxObject );

function CText:constructor( Text, X, Y, Width, Height, Color, Alpha, Scale, Font, AlignX, AlignY, Clip, WordBreak, ColorCoded, Parent )
	self.m_Text = Text;
	self.m_X = X;
	self.m_Y = Y;
	if Parent then
		self.m_X = self.m_X + Parent.m_X;
		self.m_Y = self.m_Y + Parent.m_Y;
	end
	self.m_Width = self.m_X + Width or 0;
	self.m_Height = self.m_Y + Height or 0;
	self.m_Color = Color or { 255, 255, 255 };
	self.m_Alpha = Alpha or 255;
	self.m_Scale = Scale or 1;
	self.m_Font = Font or "default";
	self.m_AlignX = AlignX or "left";
	self.m_AlignY = AlignY or "top";
	self.m_Clip = Clip or false;
	self.m_WordBreak = WordBreak or false;
	self.m_ColorCoded = ColorCoded or false;
	self.m_Parent = Parent or false;
	self.m_Type = "Text";
	self:init();
	self.m_FunctionRender = bind( CText.onRender, self );
	addEventHandler( "onClientRender", root, self.m_FunctionRender );
end

function CText:destructor()
	if self.m_FunctionRender then
		removeEventHandler( "onClientRender", root, self.m_FunctionRender );
	end
end

function CText:onRender()
	local Color = self.m_Color;
	dxDrawText ( self.m_Text, self.m_X, self.m_Y, self.m_Width, self.m_Height, tocolor( Color[1], Color[2], Color[3], self.m_Alpha ), self.m_Scale, self.m_Font, self.m_AlignX, self.m_AlignY, self.m_Clip, self.m_WordBreak, GetDefinesValue( "PostGUI" ), self.m_ColorCoded );
end