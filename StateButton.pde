class StateButton extends Button {
	int[][] colorState;
	int state ;

	StateButton(){
		super();
		colorState = new int[2][];
		colorState[0] = new int[4];
		colorState[1] = new int[4];
		state = 0;
		colorState[0][0] = 255;
		colorState[0][1] = 200;
		colorState[0][2] = 200;
		colorState[0][3] = 100;

		colorState[1][0] = 200;
		colorState[1][1] = 200;
		colorState[1][2] = 255;
		colorState[1][3] = 100;
	}

	StateButton(int x, int y, String st){
		super(x,y,st);
		colorState = new int[2][];
		colorState[0] = new int[4];
		colorState[1] = new int[4];
		state = 0;

		colorState[0][0] = 255;
		colorState[0][1] = 200;
		colorState[0][2] = 200;
		colorState[0][3] = 100;

		colorState[1][0] = 200;
		colorState[1][1] = 200;
		colorState[1][2] = 255;
		colorState[1][3] = 100;
	}

	void setColor1(int r, int g, int b, int a){
		colorState[0][0] = r;
		colorState[0][1] = g;
		colorState[0][2] = b;
		colorState[0][3] = a;
	}

	void setColor2(int r, int g, int b, int a){
		colorState[1][0] = r;
		colorState[1][1] = g;
		colorState[1][2] = b;
		colorState[1][3] = a;
	}

	boolean clicked(int x, int y){
        if(between(x,this.posX, this.posX + this.wx) && between(y, this.posY, this.posY + this.wy)){
            if(state == 0){
				state = 1;
			}
			else{
				state = 0;
			}
			return true;
        }
        else{
            return false;
        }
    }

	void drawButton(){
        stroke(colorState[state][0], colorState[state][1], colorState[state][2], colorState[state][3]);
        fill(colorState[state][0], colorState[state][1], colorState[state][2], colorState[state][3]);
        rect(this.posX,this.posY, wx,wy);
        fill(0, 102, 153);
        text(text, this.posX + 15,this.posY + 15);
    }
}