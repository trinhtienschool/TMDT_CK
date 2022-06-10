package vn.thegioidochoi.model.util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.thegioidochoi.model.header_footer.Category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class Util {
    public static String getUrlProjectPath(){
        Properties prop = new Properties();
        InputStream input = null;
        String path=null;
        try {
            File file1= new File("..\\webapps\\ROOT\\user_page\\ImageUrlLocation.properties");
            System.out.println(file1.getCanonicalPath());
            input = new FileInputStream(file1);

            // load a properties file
            prop.load(input);

            // get the property for upload path
            path=prop.getProperty("path");

        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return path;
    }
    public static long hashPass(String date_created,String email,String pass){
        return date_created.hashCode()*email.hashCode()*pass.hashCode();
    }
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

    public static String generateSlug(String input) throws UnsupportedEncodingException {
        input = input.replaceAll("đ","d");
        String convertedString =
                Normalizer
                        .normalize(input, Normalizer.Form.NFD)
                        .replaceAll("[^\\p{ASCII}]", "").replaceAll(" ", "-");

//        String s1 = Normalizer.normalize(input, Normalizer.Form.NFKD);
//        String regex = "[\\p{InCombiningDiacriticalMarks}\\p{IsLm}\\p{IsSk}]+";
//
//        String s2 = new String(s1.replaceAll(regex, "").getBytes("ascii"), "ascii");
//        return s2.replaceAll(" ","-");


        return convertedString.toLowerCase();
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
    public static String cutTheSameUrlPart(String url, String part){
//        System.out.println("urllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll: "+url);
        if(!url.contains(part)) return url;
        if(url.startsWith("&")) url=url.substring(1);
        if(url.endsWith("&")) url=url.substring(0,url.length()-1);
//        System.out.println(url);
        if(!url.contains("&")) return "";
        String[] parts = url.split("&");
        String result_url="";
        for(String p:parts){
            if(!p.contains(part)&!p.isEmpty()) result_url+="&"+p;
        }
        System.out.println("REsult "+result_url.substring(1));
        return result_url.substring(1);
    }
    public static String cutUrlAgeGender(String url, String equal){
        if(url.contains(equal)){
            System.out.println(url);
            String[] parts = url.split("&");
            System.out.println("part: "+Arrays.toString(parts));
            String result_url="";
            for(String p:parts){
                if(!p.equalsIgnoreCase(equal)&!p.isEmpty()) result_url+="&"+p;
            }
            System.out.println(result_url);
            return result_url;
        }
        return url;
    }
    public static boolean isContainSubCate(Category category,String subCateSlug){
        for(Category sc:category.getSubcategories()){
            if(sc.getSlug().equalsIgnoreCase(subCateSlug)) return true;
        }
        return false;
    }
    public static String covertArrToString(String[] arr){
        String s = Arrays.toString(arr);
        s = s.replace("[","(").replace("]",")");
        return s;
    }
    public static String makeMitilUrlParam(String title,String[] arr){
        String url = "";
        for(String a:arr){
            url+="&"+title+"="+a;
        }
        return url;
    }

    public static String getUrlFileFromUpload(FileItem fi, String name, String url) throws IOException {
        File file;
        System.out.println("Dang vao getUrlFilllllllllllllllllll");
        System.out.println(fi==null?false:true);
        // Get the uploaded file parameters
        String fieldName = fi.getFieldName();
        String fileName = fi.getName();
        System.out.println("File name: "+fileName);
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
        //write to server location
        fileNameSave += ext;
        File folder= new File("..\\webapps\\ROOT" + url);
        if(!folder.exists()) folder.mkdirs();
        file = new File("..\\webapps\\ROOT/" + url + "/" + fileNameSave);
                    System.out.println(file.getCanonicalPath());
        //write to project location


        File filePathProject = new File("D:\\School\\Codes\\TMDT_CK_Project\\TheGioiDoChoi\\src\\main\\webapp\\imgs\\user\\"+fileNameSave);
        System.out.println(filePathProject.getCanonicalPath());
        try {
            fi.write(file);
            fi.write(filePathProject);
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

    public static String makeUrlAgeGender(String type, String[] values) {
        String url = "";
        for(String value:values){
            url +="&"+type+"="+value;
        }
        return url;
    }

    public static String makeSqlConditionAgeGender(String type,String[] values) {
        String condition = " ( ";
        for(String value:values){
            int con_val = 1;
            if(value.equalsIgnoreCase("tu-1-6-tuoi") || value.equalsIgnoreCase("gt-nam")) con_val = 1;
            else if(value.equalsIgnoreCase("tu-6-11-tuoi") || value.equalsIgnoreCase("gt-nu")) con_val = 2;
            else if(value.equalsIgnoreCase("tren-12-tuoi") || value.equalsIgnoreCase("gt-unisex")) con_val = 3;

            condition +=" p."+type+"="+con_val+" or ";
        }
        System.out.println(condition);
        return condition.substring(0,condition.lastIndexOf("or ")) +" ) ";
    }
}
