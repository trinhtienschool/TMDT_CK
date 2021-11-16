package vn.thegioicaycanh.model.user;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.Date;

public class ForgetPass {
    private int user_id;
    private String email;
    private String key_forget;
    private Date date_end;

    public ForgetPass() {
    }

    public ForgetPass(int user_id, String email, long pass) {
        this.user_id=user_id;
        this.email=email;
        this.createKey_Forget(user_id,email,pass);
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE,3);
        this.date_end=calendar.getTime();
        createKey_Forget(user_id,email,pass);
    }
    public void createKey_Forget(int user_id,String email,long pass){

        //Tao 1 hashcode
        long hashcode = user_id*email.hashCode()*pass;
        //tao sha 256 code
        this.key_forget = generateSHA_256(String.valueOf(hashcode));
    }
    public static byte[] getSHA(String input) throws NoSuchAlgorithmException
    {
        // Static getInstance method is called with hashing SHA
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        // digest() method called
        // to calculate message digest of an input
        // and return array of byte
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    public static String toHexString(byte[] hash)
    {
        // Convert byte array into signum representation
        BigInteger number = new BigInteger(1, hash);

        // Convert message digest into hex value
        StringBuilder hexString = new StringBuilder(number.toString(16));

        // Pad with leading zeros
        while (hexString.length() < 32)
        {
            hexString.insert(0, '0');
        }

        return hexString.toString();
    }
    public static String generateSHA_256(String message){
        try {
            return toHexString(getSHA(message));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getKey_forget() {
        return key_forget;
    }

    public void setKey_forget(String key_forget) {
        this.key_forget = key_forget;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }
}
