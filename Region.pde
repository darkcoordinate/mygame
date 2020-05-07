class Region{
	int sx,sy, ex,ey;
	int state;
	Region(){
		sx = 0;
		sy = 0;
		ex = 0;
		ey = 0;
		state = 0;
	}

	void stay(int x, int y){
		ex = x;
		ey = y;
	}
	void display(){
		stroke(123,23, 12);
		fill(255,255,255,15);
		rect(sx,sy,ex - sx, ey - sy);
	}
}
