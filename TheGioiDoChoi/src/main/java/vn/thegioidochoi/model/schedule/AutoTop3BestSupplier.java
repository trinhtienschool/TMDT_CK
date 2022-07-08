package vn.thegioidochoi.model.schedule;

import vn.thegioidochoi.controller.user_page.TestThread;

import java.sql.SQLException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

public class AutoTop3BestSupplier {
    public static final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    public static  ScheduledFuture<?> future = null;
    public static void runSchedule() {
        future = scheduler.scheduleAtFixedRate(new Runnable() {
            @Override
            public void run() {
                updateTop3BestSupplier();
            }
        }, 2, 2, TimeUnit.SECONDS);
    }
    public static void shutdownScheduler() {
        future.cancel(true);
        scheduler.shutdown();
    }
    public static void updateTop3BestSupplier(){
        System.out.println("Update top 3 best supplier");
    }
}
