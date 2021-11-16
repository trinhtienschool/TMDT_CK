package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.home_page.Home_page;
import vn.thegioicaycanh.model.mail.Mail;
import vn.thegioicaycanh.model.user.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@WebServlet(urlPatterns = "/handle-login")
public class Login_handle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("page_menu","login");
        request.setAttribute("title","Đăng nhập");
        //Nhan form thay doi mat khau
        if(request.getParameter("email-change-pass")!=null){
            String email = request.getParameter("email-change-pass");
            String key = request.getParameter("key");
            System.out.println("Day la key: "+key);
            String pass = request.getParameter("new-pass");
            ForgetPass fp = Load_ForgetPass.loadForgetPassByEmailKey(email,key);
            if(fp!=null){
                LoadUser.changePassword(fp.getUser_id(),fp.getEmail(),pass);
                Load_ForgetPass.deleteForgetPassByKey(key);
                request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
                return;
            }else{
                notifyError(2,"Sai thông tin lấy lại mật khẩu!",request,response);
                return;
            }
        }


        //Xu li nhan link doi mat khau
        if(request.getParameter("conform-fp")!=null){
            String key =request.getParameter("key");
            ForgetPass fp = Load_ForgetPass.loadForgetPassByKey(key);
            if(fp !=null) {
                long diffInMillies = Math.abs(new Date().getTime() - fp.getDate_end().getTime());
                long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                if (diff <= 3) {
                    request.setAttribute("title", "Đổi mật khẩu");
                    request.setAttribute("key",key);
                    System.out.println("co vao day ne*********");
                    request.getRequestDispatcher("user_page/change-forgot-password.jsp").forward(request, response);
                    return;
                }
            }else{
                notifyError(2,"Sai thông tin",request,response);
                return;
            }

        }
        //Xu li nhan form quen mat khau
        if(request.getParameter("email_forget_pass")!=null){
            if(Load_ForgetPass.loadForgetPassByEmail(request.getParameter("email_forget_pass"))!=null){
                notifyError(2,"Email đã đăng kí nhận mail thay đổi mật khẩu",request,response);
                return;
            }
            User user = LoadUser.loadAUserByEmail(request.getParameter("email_forget_pass"));

            if(user !=null){
                ForgetPass fp= new ForgetPass(user.getId(),user.getEmail(),user.getPassword());
                boolean succSave=Load_ForgetPass.saveForgetPass(fp);
                if(succSave){
                    String link = "http://localhost:8080/thegioicaycanh.vn/handle-login?conform-fp=true&key="+ fp.getKey_forget();
                    String subject="Lấy lại mật khẩu";
                    String content= "Chào "+user.getName()+"!,"
                    + "\n Đây là link lấy lại mật khẩu! Link có thời hạn 3 ngày kể từ ngày nhận. Bấm vào để xác nhận\n"
                    +link;

                    Mail.sendMail(content,subject,user.getEmail());

                }
            }
            notifyError(2,"Email đã được gửi, nếu email đã đăng kí, vui lòng kiểm tra email",request,response);
            return;
        }

        //xu li chuyen trang khi nguoi dung bam vao nut dang nhap
        if(request.getParameter("login") !=null){
            //neu login=user thi chuyen den trang login cua user
            if(request.getParameter("login").equalsIgnoreCase("user")){
                //set status cho trang jsp de hieu la dang o trang thai nao
                //status = 1: đang nhap
                //status = 2: Sai tai khoan, co loi khac xay ra

                request.setAttribute("status",1);
                request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
            }
            //neu login=admin thi chuyen den trang login cho dang nhap lai
            else if(request.getParameter("login").equalsIgnoreCase("admin")){
                HttpSession session =request.getSession();
                if(session.getAttribute("user_id") !=null){
                    int user_id = (int)session.getAttribute("user_id");
                    User user = LoadUser.loadUserById(user_id);
                    if(user.getRole_id() == 2 || user.getRole_id() == 3){
                        request.getRequestDispatcher("handle-login?login=user").forward(request,response);
                    }
                }

            }
            return;
        }
        //Xu li dang xuat
        if(request.getParameter("logout") !=null){
            if(request.getParameter("logout").equalsIgnoreCase("true")){

                deleteAvailableSession(request);
                HttpSession session = request.getSession();
                session.setAttribute("cart",new Cart());
                request.getRequestDispatcher("home").forward(request, response);
            }
            return;
        }

        //Kiem tra xem nguoi dung da dang nhap va chua dang xuat hay khong
        //Neu dung thi xoa session do va tao sesion khac
//        deleteAvailableSession(request);

        //xu li xac thuc thong tin tai khoan
        String email="";
        String pass="";
        if(request.getParameter("email")!=null){
            email=request.getParameter("email");
        }
        if(request.getParameter("pass")!=null){
            pass = request.getParameter("pass");
        }
        if(email.isEmpty() || pass.isEmpty()){
            notifyError(2,"Phải nhập cả email và mật khẩu",request,response);
            return;
        }
        System.out.println(email);
        System.out.println(pass);
        User user = LoadUser.loadAUserByEmail(email);
        if(user == null){
            notifyError(2,"Sai email hoặc mật khẩu",request,response);
            return;
        }
        long passHashCode = user.getId()*email.hashCode()*pass.hashCode();
        if(passHashCode != user.getPassword()){
            notifyError(2,"Sai email hoặc mật khẩu",request,response);
        }else {
            System.out.println("Vao success");
            successLogin(request, response, user);
        }
    }

    public static void deleteAvailableSession(HttpServletRequest request) {
        if (request.getSession(false) != null) {
            request.getSession(false).invalidate();
        }
    }

    public static void successLogin(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("isAdmin")==null) {
            session.setAttribute("favourist",new FavouriteListMap(user.getId()));
            session.setAttribute("user_avatar", user.getAvatar());
            session.setAttribute("user_id", user.getId());
            session.setAttribute("user_name", user.getName());
            // them
            session.setAttribute("user_mail", user.getEmail());
            session.setAttribute("user_address",user.getAddress());
            Cart cart = new Cart(user.getId());
            session.setAttribute("cart", cart);
            if (user.getRole_id() == 2 || user.getRole_id() == 3) {
                session.setAttribute("isAdmin", true);
            }
            System.out.println("Dan chuyen den home sau khi dang nhap");
            request.getRequestDispatcher("home").forward(request, response);
        }else{
            if(user.getRole_id() == 2 || user.getRole_id() == 3){
                session.setAttribute("role_id", user.getRole_id());
                session.setAttribute("loginedAdmin",true);
                System.out.println("Sap sua vao admin_page/product");
                response.sendRedirect("admin_page/dashboard");
            }
        }

    }
    public static void notifyError(int status_id,String status_content,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status",status_id);
        request.setAttribute("status_content",status_content);
        request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
    }

}
