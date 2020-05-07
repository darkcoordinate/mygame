

class Button{
    int posX;
    int posY;
    int wx;
    int wy;
    String text;
  
    Button(){
        posX = 0;
        posY = 0;
        wx = 100;
        wy = 20;
        text = "None";
    }
    Button(int x, int y, String st){
        posX = x;
        posY = y;
        wx = 100;
        wy = 20;
        text = st;
    }
  
    void drawButton(){
        stroke(255,200,200,100);
        fill(255, 200, 200,100);
        rect(this.posX,this.posY, wx,wy);
        fill(0, 102, 153);
        text(this.text, this.posX+15,this.posY+15);
    }
  
    void drawButton(int r, int g, int b, int a){
        stroke(r,g,b,a);
        fill(r,g,b,a);
        rect(this.posX,this.posY, wx,wy);
        fill(0, 102, 153);
        text(text, this.posX,this.posY);
    }
  
    boolean clicked(int x, int y){
        if(between(x,this.posX, this.posX + this.wx) && between(y, this.posY, this.posY + this.wy)){
            return true;
        }
        else{
            return false;
        }
    }
  
}
