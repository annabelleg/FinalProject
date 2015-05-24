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
    
    public void REF(){
	int leading1col = 0;
	for (int r = 0; r < rows; r++){
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
	}
		
    }
}
