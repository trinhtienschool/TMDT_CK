package vn.thegioicaycanh.controller.user_page;

public class TestPass {
    public static void main(String[] args) {
        int id = 1;
        String email = "trinhtien6236@gmail.com";
        String pass = "Tien12345@";
        long passEn =  id*email.hashCode()*pass.hashCode();
        System.out.println(passEn);
    }
}
