// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A basic implementation of John Conway's Game of Life CA
// how could this be improved to use object oriented programming?
// think of it as similar to our particle system, with a "cell" class
// to describe each individual cell and a "cellular automata" class
// to describe a collection of cells

GOL gol;
StateButton button;
StateButton addBlockButton;
StateButton selectState;
Button saveBlock;
Button loadBlock;
Button clear;
Block block;
Region Ri;
boolean between(int val, int l1, int l2){
    if(val < max(l1,l2) &&val > min(l1,l2)){
        return true;
    }
    else{
        return false;
    }
}
void setup() {
    size(1200, 800);
    frameRate(24);
    gol = new GOL();
    button = new StateButton(100,100, "Pause");
    addBlockButton = new StateButton(200,100, "Add Block");
    selectState = new StateButton(300,100, "Select State");
    saveBlock = new Button(100,150, "Save Block");
    loadBlock = new Button(200,150, "Load Block");
    clear = new Button(300,150, "Clear");
    block = new Block(1,1);
    block.load("file.block");
    Ri = new Region();
    /*block.block[0][0] = 1;
    block.block[0][1] = 0;
    block.block[0][2] = 1;

    block.block[1][0] = 1;
    block.block[1][1] = 0;
    block.block[1][2] = 0;

    block.block[2][0] = 1;
    block.block[2][1] = 0;
    block.block[2][2] = 0;*/
}

boolean run = true;
void draw() {
    background(255);
    if(button.state == 1){
        gol.generate();
        gol.display();
    }
    else{
        gol.display();
        if(addBlockButton.state == 1){
            block.display(mouseX, mouseY);
        }
    }
    if(Ri.state  == 1){
        Ri.display();
    }
    button.drawButton();
    addBlockButton.drawButton();
    selectState.drawButton();
    saveBlock.drawButton();
    loadBlock.drawButton();
    clear.drawButton();
}

// reset board when mouse is pressed


void mouseMoved(){
    if(selectState.state == 1){
        Ri.stay(mouseX, mouseY);
    }
}
void mousePressed() {
    if(button.clicked(mouseX, mouseY)){
        if(button.state == 1){
            selectState.state = 0;
            addBlockButton.state = 0;
        }
    }
    else if(addBlockButton.clicked(mouseX,mouseY)){
        if(addBlockButton.state == 1){
            button.state  = 0;
            selectState.state = 0;
        }
    }
    else if(selectState.clicked(mouseX,mouseY)){
        if(selectState.state == 1){
            button.state = 0;
            addBlockButton.state = 0;
            Ri.state = 0;
        }
    }
    else if(saveBlock.clicked(mouseX,mouseY)){
        block.save("file.block");
    }
    else if (clear.clicked(mouseX, mouseY)) {
        gol.blank();
    }
    else{
        if(button.state == 0){
            if(addBlockButton.state == 1){
                gol.addBlock(block.block, mouseX,mouseY);
            }
            else if(selectState.state == 1){
            }
            else{
                gol.mouseSwitch(mouseX, mouseY);
            }
        }
    }
}

void mouseClicked(){

    if(selectState.state == 1){
        if(Ri.state == 0){
            Ri.state = 1;
            Ri.sx = mouseX;
            Ri.sy = mouseY;
        }
        else{
            Ri.state = 0;
            block.block = gol.get_block(Ri.sx, Ri.sy, Ri.ex, Ri.ey);
            block.columns = block.block.length;
            block.rows = block.block[0].length;
        }
    }
}
