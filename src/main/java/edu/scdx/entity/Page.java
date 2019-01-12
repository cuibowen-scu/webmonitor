package edu.scdx.entity;

public class Page {

    public static int caculateLast(int total, int count) {
        int last = 0;
        if (0 == total % count) {
            last = total - count;
        } else {
            last = total - total % count;
        }
        return last;

    }


}
