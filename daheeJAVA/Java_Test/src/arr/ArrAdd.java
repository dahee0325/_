package arr;

public class ArrAdd {

	public static void addOneDArr(int[][] arr, int add){
		
		for (int i=0; i<arr.length; i++) 
		{
				for(int j=0; j<arr[i].length; j++) {
					
					arr[i][j] +=add;
					
				}
			}
	}
	
	public void addPrint(int[][] arr) {
		for (int i = 0; i < arr.length; i++) {
			for(int j = 0; j<arr[i].length; j++){
				System.out.println("arr[" + i + "]["+j+"] = " + arr[i][j]);
			}
			
		}
	}
	
}
