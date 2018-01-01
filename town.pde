// Global variables
color black = #000000;
color white = #FFFFFF;
color backColor = #028909;
color road = #787878;
color building = #B4B4B4;
color titleColor = black;
color textColor = black;

// ----- Title information
int titleSize = 30;
int titleY = titleSize / 3;
String title = "Jaont Prime Colony (Grand Lady Grace Colony Mode plus Expansion)";
PFont fontA = loadFont("courier-mono");

// ----- Canvas information
int fontSize = 18; // Keep divisible by 3
int fontcursorX = fontSize / 3;
int canvasX = 1600;
int canvasY = 1600;
int margin = 15;
int drawYMin = titleSize + titleY + margin;

// ----- Housing information
int houseW = 200;
int houseH = 150;
int cryoW = 200;
int cryoH = 150;
int farmW = 200;
int farmH = 150;

// ----- Object size information
int roadWidth = 25;
int adminOffset = roadWidth;
int adminWidth = houseW - (2 * adminOffset) - (2 * roadWidth);

// ----- Section size information
int housingH = (2 * houseH) + (2 * roadWidth);
int housingW = (3 * houseW) + (2 * roadWidth);
int adminTotal = adminWidth + (roadWidth * 2) + (adminOffset * 2);
int labTotalH = houseH + adminTotal + (2 * roadWidth);
int labTotalW = houseW + roadWidth;
int fuelTotalH = houseH + adminTotal + (2 * roadWidth);
int fuelTotalW = houseW + adminTotal + roadWidth;
int factoryTotalH = (2 * houseH) + roadWidth;
int factoryTotalW = labTotalW + fuelTotalW;
int landingTotalH = housingH + labTotalH + factoryTotalH;
int landingTotalW = roadWidth + houseW;

// Prepare the canvas...
void setup()
{
	// Setup canvas
	size(canvasX, canvasY);
	background(backColor);
	fill(black);
	noLoop();
}


// Constantly repeating function
void draw()
{  
	int cursorX = margin;
	int cursorY = drawYMin;

	drawTitle();
	drawLanding(cursorX + housingW, cursorY);
	drawHousing(cursorX, cursorY);

	cursorY += housingH;
	drawLab(cursorX, cursorY);

	cursorX += houseW + roadWidth;
	drawAdmin(cursorX, cursorY);
	drawFuel(cursorX, cursorY); // The upper corner of fuel and admin are the same
	cursorX -= houseW + roadWidth;

	cursorY += labTotalH;
	drawFactory(cursorX, cursorY);
}

// ----- Drawing Functions -----
// Draws in the title
void drawTitle()
{
	textAlign(CENTER, TOP);
	fill(titleColor);
	// Load our font in
	textFont(fontA, titleSize);
	text(title, canvasX / 2, titleY);
}

// Draws the administration area
void drawAdmin(int x, int y)
{
	// Roads
	roadOffset = (adminWidth / 2) + (roadWidth / 2) + adminOffset;
	drawRoad(x, y + roadOffset, adminTotal, roadWidth);
	drawRoad(x + roadOffset, y, roadWidth, adminTotal);

	// Adjust for circles
	int circleOffset = adminTotal / 2;
	x += circleOffset;
	y += circleOffset;

	// Draw circles
	prepRoad();
	ellipse(x, y, adminWidth + (roadWidth * 2), adminWidth + (roadWidth * 2));
	prepBuilding();
	ellipse(x, y, adminWidth, adminWidth);

	// Text
	prepText();
	textAlign(CENTER, CENTER);
	text("Bridge/", x, y - (fontSize / 2));
	text("Admin", x, y + (fontSize / 2));
}

// Lab and hospital
void drawLab(int x, int y)
{
	// Roads
	drawRoad(x + houseW, y, roadWidth, labTotalH);
	drawRoad(x, y + adminTotal, labTotalW, roadWidth);
	drawRoad(x, y + houseH + adminTotal + roadWidth, labTotalW, roadWidth);

	// Buildings
	drawBuilding(x, y, houseW, adminTotal, "Laboratory");
	drawBuilding(x, y + adminTotal + roadWidth, houseW, houseH, "Hospital");
}

// Fuel storage and fuel processing
void drawFuel(int x, int y)
{
	// Roads
	drawRoad(x, y + adminTotal, houseW + roadWidth, roadWidth);
	drawRoad(x, y + adminTotal + houseH + roadWidth, fuelTotalW, roadWidth);
	drawRoad(x + adminTotal, y, roadWidth, fuelTotalH);

	// Buildings
	drawBuilding(x, y + adminTotal + roadWidth, houseW, houseH, "Fuel Processing");
	drawBuilding(x + adminTotal + roadWidth, y, houseW, houseH + adminTotal + roadWidth, "Fuel Storage");
}

// Housing, farms and cryo
void drawHousing(int x, int y)
{
	// Roads
	// ----- Across
	drawRoad(x + houseW, y, roadWidth, housingH);
	drawRoad(x + (2*houseW) + roadWidth, y, roadWidth, housingH);
	// ----- Down
	drawRoad(x, y + houseH, housingW, roadWidth);
	drawRoad(x, y + (2*houseH) + roadWidth, housingW, roadWidth);

	// Housing (back)
	drawBuilding(x, y, houseW, houseH, "Housing Block A");
	drawBuilding(x+houseW+roadWidth, y, houseW, houseH, "Housing Block B");
	drawBuilding(x+(2*houseW)+(2*roadWidth), y, houseW, houseH, "Housing Block C");

	// Cryo Block (central)
	y += houseH + roadWidth;
	drawBuilding(x+houseW+roadWidth, y, houseW, houseH, "Cryo Block");

	// Farms (sides of cryo)
	drawBuilding(x, y, houseW, houseH, "Farm Block A");
	drawBuilding(x+(2*houseW)+(2*roadWidth), y, houseW, houseH, "Farm Block B");
}

// Factory, warehouse and fusion plant
void drawFactory(int x, int y)
{
	int factoryW = factoryTotalW - roadWidth - houseW;

	// Roads
	drawRoad(x, y + houseH, factoryTotalW, roadWidth);
	drawRoad(x + factoryW, y, roadWidth, houseH);

	// Buildings
	drawBuilding(x, y, factoryW, houseH, "Factory");
	drawBuilding(x + factoryW + roadWidth, y, houseW, houseH, "Fusion Power Plant");
	drawBuilding(x, y + houseH + roadWidth, factoryTotalW, houseH, "Warehouse / Garage");
}

// The landing area
void drawLanding(int x, int y)
{
	int tempY = y;

	// Roads
	drawRoad(x, y, roadWidth, landingTotalH);
	y += houseH;
	drawRoad(x, y, landingTotalW, roadWidth);
	y += roadWidth + houseH;
	drawRoad(x, y, landingTotalW, roadWidth);
	y += roadWidth + houseH;
	drawRoad(x, y, landingTotalW, roadWidth);
	y += roadWidth + houseH;
	drawRoad(x, y, landingTotalW, roadWidth);
	y += roadWidth + houseH;
	drawRoad(x, y, landingTotalW, roadWidth);

	y = tempY;

	// "Buildings"
	x += roadWidth;
	drawBuilding(x, y, houseW, houseH, "Landing Pad 1");
	y +=  + roadWidth + houseH;
	drawBuilding(x, y, houseW, houseH, "Landing Pad 2");
	y +=  + roadWidth + houseH;
	drawBuilding(x, y, houseW, houseH, "Landing Pad 3");
	y +=  + roadWidth + houseH;
	drawBuilding(x, y, houseW, houseH, "Landing Pad 4");
	y +=  + roadWidth + houseH;
	drawBuilding(x, y, houseW, houseH, "Maintenance Bay");
	y +=  + roadWidth + houseH;
	drawBuilding(x, y, houseW, adminTotal, "Helicopter Maintenance\nand Helipads 1 thru 6");
}

// Prepare to draw a road
void prepRoad()
{
	noStroke();
	fill(road);
}

// Draws a road
void drawRoad(int x, int y, int width, int height)
{
	prepRoad();
	rect(x, y, width, height);
}

// Prepare to draw a building
void prepBuilding()
{
	stroke(black);
	fill(building);
}

// Prepare to draw text
void prepText()
{
	// Load our font in
	textAlign(LEFT);
	textFont(fontA, fontSize);
	fill(textColor);
}

// Draws a building
void drawBuilding(int x, int y, int width, int height, String toDisplay)
{
	prepBuilding();
	rect(x, y, width, height);

	// Sizes chosen off of size of textFont
	prepText();
	text(toDisplay, x+fontcursorX, y+fontSize);
}