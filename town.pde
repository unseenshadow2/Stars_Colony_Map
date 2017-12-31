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
String title = "Jaont Prime Colony";
PFont fontA = loadFont("courier-mono");

// ----- Canvas information
int fontSize = 18; // Keep divisible by 3
int fontXOffset = fontSize / 3;
int canvasX = 800;
int canvasY = 800;
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
int adminWidth = 100;

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

}

// Lab and hospital
void drawLab(int x, int y)
{

}

// Fuel storage, fusion generator, fuel processing
void drawFuel(int x, int y)
{

}

// Housing, farms and cryo
void drawHousing(int x, int y)
{
    // Roads
    // ----- Across
    drawRoad(x + houseW, y, roadWidth, (2*houseH) + (2*roadWidth));
    drawRoad(x + (2*houseW) + roadWidth, y, roadWidth, (2*houseH) + (2*roadWidth));
    // ----- Down
    drawRoad(x, y + houseH, (3*houseW) + (2*roadWidth), roadWidth);
    drawRoad(x, y + (2*houseH) + roadWidth, (3*houseW) + (2*roadWidth), roadWidth);

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