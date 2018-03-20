global class MyScheduledClass implements Schedulable{
    global void execute (SchedulableContext ctx)
    {
        //Do something here.
        System.debug('I am in the execute method.');
    }   
}