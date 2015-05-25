public class Matrix{
    double[][] data;
    int rows, cols;

    public  Matrix(int r, int c){
	rows = r; 
	cols = c;
	data = new double[rows][cols];
    }
    public void enterData(){
	for (int r = 0; r < rows; r++){
	    for (int c = 0; c < cols; c++){
		data[r][c] = r+c*2.0 + 1;
	    }
	}
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
    
    public static void main(String[]args){
	Matrix m = new Matrix(3,4);
	m.enterData();
	System.out.println(m.displayMatrix());
	m.REF();
System.out.println(m.displayMatrix());
    }

    public void switchRows(int[] a, int[] b){
	for (int c = 0; c < cols; c++){
	    double temp = a[c];
	    a[c] = b[c];
	    b[c] = temp;
	}
    }
    
    public void REF(){
	int leading1col = 0;
	int r = 0;
	while (r < rows-1){
	    if (data[r][0] == 0.0 && data[r+1][0] != 0.0){
		switchRows(data[r], data[r+1]);
	    }
	    r++;
	}
	r=0;
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
		if (data[tempr][leading1col] != 0.0){
		    double shearval = data[r][leading1col];
		    for (int i = 0; i < cols; i++){
			data[tempr][i] = (-1)*shearval*(data[r][i]);
		    }
		}else if(data[tempr][leading1col] == 0.0){
		    tempr++;
		}
		tempr++;
	    }

	    r++;
	}
		
    }
}
