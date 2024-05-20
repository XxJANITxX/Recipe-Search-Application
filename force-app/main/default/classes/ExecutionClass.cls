public with sharing class ExecutionClass {
    public ExecutionClass() {
        Calculator c = new Calculator(12, 14);
        c.add();
        c.subtract();
        System.debug('Hello There');
    }
}