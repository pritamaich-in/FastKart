package com.fastkart.helper;

public class Helper {

    public static String getFirst10Words(String desc) {
        String[] strArr = desc.split(" ");
        String result = "";
        if (strArr.length > 10) {
            for (int i = 0; i < 10; i++) {
                result += (strArr[i] + " ");
            }
            return result+"...";
        } else {
            return desc;
        }
    }
}
