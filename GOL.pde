// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class GOL {

    int w = 4;
    int columns, rows;

    // Game of life board
    int[][] board;


    GOL() {// Initialize rows, columns and set-up arrays
        columns = width/w;
        rows = height/w;
        board = new int[columns][rows];
        //next = new int[columns][rows];
        // Call function to fill array with random values 0 or 1
        //init();
        blank();
    }

    void init() {
        for (int i =1;i < columns-1;i++) {
            for (int j =1;j < rows-1;j++) {
                board[i][j] = int(random(2));
            }
        }
    }
  
    void blank(){
        for (int i =1;i < columns-1;i++) {
            for (int j =1;j < rows-1;j++) {
                board[i][j] = 0;
            }
        }
    }
    void mouseSwitch(int i, int j){
        int a = i/w;
        int b = j/w;
        if(board[a][b] == 1){
            board[a][b] = 0;
        }
        else{
            board[a][b] = 1;
        }
    }

    int[][] get_block(int x1, int y1, int x2, int y2){
        int xa = min(x2,x1)/w;
        int ya = min(y2,y1)/w;
        int xb = max(x2,x1)/w;
        int yb = max(y2,y1)/w;
        return get_section(xa,ya,xb - xa, yb -ya);
        
    }
    int[][] get_section(int x, int y, int a , int b){
        int[][] block = new int[a][b];
        for(int i = 0; i < a; i++){
            for(int j = 0; j < b; j++){
                block[i][j] = board[x + i][y + j]; 
                print(board[i][j]);
                print(" ");
            }
            print("\n");
        }
        return block;
    }
    
    void addBlock(int[][] block, int x, int y){
        x = x/w;
        y = y/w;
        for(int i = 0; i < block.length; i++){
            for( int j = 0; j < block[i].length ;j++){
                board[x + i][y + j] = block[i][j];
            }
        }
    }

  // The process of creating the new generation
    void generate() {

        int[][] next = new int[columns][rows];

        // Loop through every spot in our 2D array and check spots neighbors
        for (int x = 1; x < columns-1; x++) {
            for (int y = 1; y < rows-1; y++) {

                // Add up all the states in a 3x3 surrounding grid
                int neighbors = 0;
                for (int i = -1; i <= 1; i++) {
                    for (int j = -1; j <= 1; j++) {
                        neighbors += board[x+i][y+j];
                    }
                }

                // A little trick to subtract the current cell's state since
                // we added it in the above loop
                neighbors -= board[x][y];

                // Rules of Life
                if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // Loneliness
                else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // Overpopulation
                else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // Reproduction
                else                                            next[x][y] = board[x][y];  // Stasis
            }
        }

        // Next is now our board
        board = next;
    }

    // This is the easy part, just draw the cells, fill 255 for '1', fill 0 for '0'
    void display() {
        stroke(255);
        for ( int i = 0; i < columns;i++) {
            for ( int j = 0; j < rows;j++) {
                if ((board[i][j] == 1)) {
                    stroke(50);
                    fill(0);
                }
                else{
                    stroke(200);
                    fill(255);
                }
                rect(i*w, j*w, w, w);
            }
        }
    }
}
