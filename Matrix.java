public class Matrix{
    double[][] data;
    int rows, cols;

    public  Matrix(int r, int c){
	rows = r; 
	cols = c;
	data = new double[r][c];
	enterData();
    }
    public void enterData(){
	for (int r = 0; r < rows; r++){
	    for (int c = 0; c < cols; c++){
		data[r][c] = (int) (Math.random()*10) * 1.0;
	    }
	}
	data[0][0] = 0.0;
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
    
    public void REF(){
        exchange();
	dilateAndShear();
	

    }
    public void exchange(){
	for (int r = 0;r < rows; r++){
	    int k = 1;
	    while (k < rows-r){
		if (findLeadingEntry(r) > findLeadingEntry(r+k)){
		    switchRows(r,r+k);
		}
		k++;
	    }
	}
    }
    public int findLeadingEntry(int row){
	for (int c = 0; c < cols; c++){
	    if (data[row][c] != 0.0)
		return c;
	}
	return -1;
    }
    public void switchRows(int a, int b){
	for (int c = 0; c < cols; c++){
	    double temp = data[a][c];
	    data[a][c] = data[b][c];
	    data[b][c] = temp;
	}
    }
    
    public void dilateAndShear(){
    	int r=0;
	while (r < rows){
	    int c = findLeadingEntry(r);
	    if (c >= 0){
		dilate(r,c);
		shear(r,c);
	    }
	    r++;
	}
    }
    public void dilate(int r, int c){
	if (data[r][c] != 1.0){
	    double val = 1/data[r][c];
	    for (int i = c; i < cols; i++){
		data[r][i] = data[r][i]*val;
	    }
	}
    }

    public void shear(int r, int c){
	int tempr = 0;
        while (tempr < rows){
	    if (tempr != r){
		double shearval = data[tempr][c];
		int startval = findLeadingEntry(tempr);
		for (int i = startval; i < cols; i++){
		    data[tempr][i] = data[tempr][i] + (-1)*shearval*(data[r][i]);
		}
	    }
	    tempr++;
	}
    }
	
    public static void main(String[]args){
	Matrix m = new Matrix(4,4);
	//	m.enterData();
	System.out.println(m.displayMatrix());
	m.REF();
	System.out.println(m.displayMatrix());
    }

}
