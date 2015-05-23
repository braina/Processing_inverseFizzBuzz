void setup(){
  
  printFB( new String[]{"fizz"} );
  printFB( new String[]{"fizz","fizz"} );
  printFB( new String[]{"fizz","buzz"} );
  printFB( new String[]{"fizz","fizz","buzz"} );
  printFB( new String[]{"fizzbuzz","fizz"} );

}


void printFB(String[] input){
  ArrayList<Integer> res = inverseFizzBuzz(input); 
  if(res == null){
    println("NoSuchData");
    return;
  }
  
  ArrayList<String> input_list = new ArrayList<String>();
  for(String element:input){
    input_list.add(element);
  }

  print(input_list, "=> ");
  println(res);
}


//同じものが帰ってきた場合に、最短で、indexが最小のものを選ぶ
ArrayList<Integer> inverseFizzBuzz(String[] input){
  ArrayList<Integer> res,min_res = null;

  for(int i=1;i<=15;i++){
    if((res = candidate(input,i))== null) continue;
    if(min_res == null || min_res.size()> res.size())
      min_res = res;
  }

  return min_res;
}



//InverseFizzBuzzの候補をあげる。
//与えられた配列の順番でFizzBuzzをみたす必要最低限の物のみを返し、
//その他の時はnullを返す。
ArrayList<Integer> candidate(String[] input, int begin){
  if(toFizzBuzz(begin) == null) return null;  
  int i = begin;

  ArrayList<Integer> candidate = new ArrayList<Integer> ();
  String fizz_buzz;

  for(String element : input){
    while ((fizz_buzz = toFizzBuzz(i)) == null){ candidate.add(i++); }
    if(element == fizz_buzz) candidate.add(i++);
    else return null;  
  }

  return candidate;
}



String toFizzBuzz(int num){
  boolean m3 = num%3 == 0,
          m5 = num%5 == 0;

  return (m3&&m5)? "fizzbuzz":
    (m3)?     "fizz":
    (m5)?     "buzz":
    null;
}




