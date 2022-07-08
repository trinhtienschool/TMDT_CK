package vn.thegioidochoi.listener;



import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

class MyAppServletContextListener
        implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
//        AutoTop3BestSupplier.shutdownScheduler();
        System.out.println("ServletContextListener destroyed");
    }

    //Run this before web application is started
    @Override
    public void contextInitialized(ServletContextEvent arg0) {
//        AutoTop3BestSupplier.runSchedule();
        System.out.println("ServletContextListener started");
    }
}
