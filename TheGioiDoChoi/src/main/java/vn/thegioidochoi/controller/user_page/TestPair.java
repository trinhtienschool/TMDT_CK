package vn.thegioidochoi.controller.user_page;

import java.util.Objects;

public class TestPair {
    private int numa; //order_id
    private int numb; // product_id
    private double numc; //product price

    public TestPair(int numa, int numb, double numc) {
        this.numa = numa;
        this.numb = numb;
        this.numc = numc;

    }

    public double getNumc() {
        return numc;
    }

    public void setNumc(double numc) {
        this.numc = numc;
    }

    public int getNuma() {
        return numa;
    }

    public void setNuma(int numa) {
        this.numa = numa;
    }

    public int getNumb() {
        return numb;
    }

    public void setNumb(int numb) {
        this.numb = numb;
    }

    @Override
    public int hashCode() {
        return Objects.hash(numa, numb);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        if (this.getClass() != o.getClass()) return false;
        TestPair testPair = (TestPair) o;
        return numa == testPair.getNuma()
                && numa == testPair.getNuma();

    }

    @Override
    public String toString() {
        return numa+","+numb+","+numc;
    }
}
