package vn.thegioidochoi.model.schedule;

import vn.thegioidochoi.Dao.LoadTopSupplierHistory;
import vn.thegioidochoi.Dao.Load_Supplier;
import vn.thegioidochoi.model.supplier.Supplier;

import java.util.List;
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
        }, 2, 30, TimeUnit.DAYS);
    }
    public static void shutdownScheduler() {
        future.cancel(true);
        scheduler.shutdown();
    }
    public static void updateTop3BestSupplier(){
        List<Supplier> suppliers = Load_Supplier.loadTopSupplierPriviousMonth(3);
        for(Supplier supplier:suppliers){
            LoadTopSupplierHistory.insertTopSupplierHistory(supplier.getId(),1);
        }

    }
}
