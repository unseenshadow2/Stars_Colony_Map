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
int fontXOffset = fontSize / 3;
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
int housingW;
int housingH;
int adminTotal = adminWidth + (roadWidth * 2) + (adminOffset * 2);
int labTotalH = houseH + adminTotal + (2 * roadWidth);
int labTotalW = houseW + roadWidth;

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
    int xOffset = margin;
    int yOffset = drawYMin;

    drawTitle();
    drawHousing(xOffset, yOffset);

    yOffset += housingH;
    drawLab(xOffset, yOffset);

    xOffset += houseW + roadWidth;
    drawAdmin(xOffset, yOffset);
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

// Fuel storage, fusion generator, fuel processing
void drawFuel(int x, int y)
{

}

// Housing, farms and cryo
void drawHousing(int x, int y)
{
    housingH = (2 * houseH) + (2 * roadWidth);
    housingW = (3*houseW) + (2*roadWidth);

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

// Factory, warehouse and landing
void drawFactory(int x, int y)
{

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
    text(toDisplay, x+fontXOffset, y+fontSize);
}