public class Matrix{
    double[][] data;
    int rows, cols;

    public  Matrix(){
	rows = 3; 
	cols = 4;
	data = new double[3][4];
	enterData();
    }
    public void enterData(){
	/*	for (int r = 0; r < rows; r++){
	    for (int c = 0; c < cols; c++){
		data[r][c] = c*2.0 + 1 - r;
	    }
	}*/
	data[0][0] = 0.0;
	data[0][1] = 2.0;
	data[0][2] = -1.0;
	data[0][3] = 4.0;
	data[1][0] = 1.0;
	data[1][1] = 6.0;
	data[1][2] = 0.0;
	data[1][3] = 2.0;
	data[2][0] = 0.0;
	data[2][1] = 0.0;
	data[2][2] = 3.0;
	data[2][3] = 9.0;
    }
    public String displayMatrix(){
	String ans = "";
        for (int r = 0; r < rows; r++){
	    for (int c = 0; c < cols; c++){
		ans += data[r][c] + " ";
	    }
	    ans += "\n";
	}
	return ans;
    }
    
   
    public void switchRows(int a, int b){
	for (int c = 0; c < cols; c++){
	    double temp = data[a][c];
	    data[a][c] = data[b][c];
	    data[b][c] = temp;
	}
    }
    public void exchange(){
	int leading1col = 0;
	int nextL1C = 0;
	for (int r = 0;r < rows-1; r++){
	    for (int c = 0; c < cols-1; c++){
		if (data[r][c] == 0.0 && data[r][c+1] != 0.0){
		    leading1col = c+1;
		}
		if (data[r+1][c] == 0.0 && data[r+1][c+1] != 0.0){
		    nextL1C = c+1;
		}
	    }
	    if (nextL1C > leading1col){
		switchRows(r,r+1);
	    }
	    r++;
	    leading1col = 0;
	    nextL1C = 0;
	}
    }
    
    public void REF(){
        exchange();
	/*	int r=0;
	int leading1col = 0;
        while (r < rows){
	    int c = 0;
	    //DILATION
	    while (c < cols && data[r][c] == 0.0){
		c++;
		leading1col++;
	    }
	    if (c == 0 || (data[r][c] != 1.0 && data[r][c-1] == 0.0)){
		double val = 1/data[r][c];
		for (int i = c; i < cols; i++){
		    data[r][i] = data[r][i]*val;
		}
	    }
	    //SHEARING
	    int tempr = 0;
	    while (tempr < rows){
		if (tempr == r){
		    tempr++;
		}
		if (tempr < rows){
		    if (data[tempr][leading1col] != 0.0){
			double shearval = data[r][leading1col];
			for (int i = 0; i < cols; i++){
			    data[tempr][i] = data[tempr][i] + (-1)*shearval*(data[r][i]);
			}
		    }else if(data[tempr][leading1col] == 0.0){
			tempr++;
		    }
		}
		tempr++;
	    }

	    r++;
	}
	*/
    }

    public static void main(String[]args){
	Matrix m = new Matrix();
	//	m.enterData();
	System.out.println(m.displayMatrix());
	m.REF();
	System.out.println(m.displayMatrix());
    }

}
