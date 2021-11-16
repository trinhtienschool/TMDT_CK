package vn.thegioicaycanh.model.util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class Util {
    public static String formatCurrency(double price) {
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return numberFormat.format(price);
    }

    public static String dateFormat(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    public static String dateFormatNoTime(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    public static String generateSlug(String input) {
        String convertedString =
                Normalizer
                        .normalize(input, Normalizer.Form.NFD)
                        .replaceAll("[^\\p{ASCII}]", "").replaceAll(" ", "-");
        return convertedString;
    }
    public static String revertDate(String date){
        String day = date.substring(0,date.indexOf("-"));
        String month = date.substring(date.indexOf("-")+1,date.lastIndexOf("-"));
        String year = date.substring(date.lastIndexOf("-")+1,date.length());
        return year+"-"+month+"-"+day;
    }

    public static Iterator<FileItem> uploadFile(HttpServletRequest request, HttpServletResponse response) {
        int maxMemSize = 1024 * 1024;//1MB
        int maxFileSize = 1024 * 1024;
        List<String> imgUrls = new ArrayList<String>();
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) {

        }

        DiskFileItemFactory factory = new DiskFileItemFactory();

        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        Iterator<FileItem> i = null;
        try {
            // Parse the request to get file items.
            List<FileItem> fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            i = fileItems.iterator();


//            out.println("</body>");
//            out.println("</html>");
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return i;
    }

    public static String getUrlFileFromUpload(FileItem fi, String name, String url) {
        File file;
        System.out.println(fi==null?false:true);
        // Get the uploaded file parameters
        String fieldName = fi.getFieldName();
        String fileName = fi.getName();
        String contentType = fi.getContentType();
        boolean isInMemory = fi.isInMemory();
        long sizeInBytes = fi.getSize();
        String ext;
        // Write the file
        name=name.replaceAll("\\?|!|\\.|,","");
        String fileNameSave = name;
        if (fileName.lastIndexOf(".") >= 0 && !fileName.isEmpty()) {
            ext = fileName.substring(fileName.lastIndexOf("."));
        } else {
            return null;
        }

        fileNameSave += ext;
        File folder= new File("..\\webapps\\thegioicaycanh.vn/" + url);
        if(!folder.exists()) folder.mkdirs();
        file = new File("..\\webapps\\thegioicaycanh.vn/" + url + "/" + fileNameSave);
//                    System.out.println(file.getCanonicalFile());
        try {
            fi.write(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
//                    out.println("Uploaded Filename: " + fileName + "<br>");
        return url + "/" + fileNameSave;
    }


    public static boolean hasMoreParameter(HttpServletRequest request) {
        Enumeration<String> parameterNames = request.getParameterNames();
       return  parameterNames.hasMoreElements();
    }
}
