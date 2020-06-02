package Practice;

public class Example {

	public void method(boolean print) {
		if(print) {
			int insideIf = 10;
			System.out.println(insideIf);
		}
		
	}
	
	public static void main(String[] args) {
		new Example().method(true);
	}
}
