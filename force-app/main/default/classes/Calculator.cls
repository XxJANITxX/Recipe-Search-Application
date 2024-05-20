public class Calculator {
    
    private Integer a;
    private Integer b;
    
    public Calculator(Integer a, Integer b){
        this.a = a;
        this.b = b;
    }
    
    public void add(){
        System.debug('Sum = '+ (this.a + this.b));
    }

    public void subtract(){
        System.debug('Subtract = '+(this.a - this.b));
    }
}