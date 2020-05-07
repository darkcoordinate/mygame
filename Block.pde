class Block{
	int w = 4;
    int columns, rows;

    // Game of life board
    int[][] block;

	Block(int x,int y) {// Initialize rows, columns and set-up arrays
        columns = x;
        rows = y;
        block = new int[columns][rows];
    }
	void display(int mx, int my) {
		mx = mx/w;
		my = my/w;
        stroke(255,255,255,134);
        for ( int i = 0; i < columns;i++) {
            for ( int j = 0; j < rows;j++) {
                if ((block[i][j] == 1)) {
                    stroke(255,234,123,134);
                    fill(124,82,25,134);
                }
                else{
                    stroke(255,255,255,134);
                    fill(255,255,255,134);
                }
                rect(mx*w + i*w,my*w + j*w, w, w);
            }
        }
    }

    void save(String fileName){
        PrintWriter saveOut;
        saveOut = createWriter(fileName);
        for(int i = 0; i < this.columns; i++){
             for(int j =0; j < this.rows; j++){
                saveOut.print(this.block[i][j]);
                saveOut.print(" ");
            }
            saveOut.print("\n");
        }
        saveOut.flush();
        saveOut.close();
    }

    void load(String fileName){
        String[] line = loadStrings(fileName);
        this.block = new int[line.length][];
        for(int i = 0; i < line.length; i++){
            String[] s = split(line[i]," ");
            block[i] = new int[s.length];
            for(int j = 0; j < s.length - 1; j++){
                block[i][j] = Integer.parseInt(s[j]);
            }
        }
        this.columns = this.block.length;
        this.rows = this.block[0].length;
    }
}
