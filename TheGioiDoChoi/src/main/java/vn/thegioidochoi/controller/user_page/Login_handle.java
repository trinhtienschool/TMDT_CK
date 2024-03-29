package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.Dao.*;
import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.mail.Mail;
import vn.thegioidochoi.model.notifications.Notifications;
import vn.thegioidochoi.model.user.*;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@WebServlet(urlPatterns = "/handle-login")
public class Login_handle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("page_menu", "login");
        request.setAttribute("title", "Đăng nhập");
        //Nhan form thay doi mat khau
        if (request.getParameter("email-change-pass") != null) {
            forgetPass(request, response);
            return;
        }


        //Xu li nhan link doi mat khau
        if (request.getParameter("conform-fp") != null) {
            enterForgetPass(request, response);
            return;

        }
        //Xu li nhan form quen mat khau
        if (request.getParameter("email_forget_pass") != null) {
            handleForgetPass(request, response);
            return;
        }

        //xu li chuyen trang khi nguoi dung bam vao nut dang nhap
        if (request.getParameter("login") != null) {
            //neu login=user thi chuyen den trang login cua user
            enterLogin(request, response);
            return;
        }
        //Xu li dang xuat
        if (request.getParameter("logout") != null) {
            handleLogout(request, response);
            return;
        }

        //Kiem tra xem nguoi dung da dang nhap va chua dang xuat hay khong
        //Neu dung thi xoa session do va tao sesion khac
//        deleteAvailableSession(request);

        //xu li xac thuc thong tin tai khoan
        handleLogin(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = "";
        String pass = "";
        if (request.getParameter("email") != null) {
            email = request.getParameter("email");
        }
        if (request.getParameter("pass") != null) {
            pass = request.getParameter("pass");
        }
        if (email.isEmpty() || pass.isEmpty()) {
            notifyError(2, "Phải nhập cả email và mật khẩu", request, response);
            return;
        }
        System.out.println(email);
        System.out.println(pass);
        User user = LoadUser.loadAUserByEmail(email);

        if (user == null) {
            notifyError(2, "Sai email hoặc mật khẩu", request, response);
            return;
        }
        System.out.println("Date_createdLogin: " + Util.dateFormat(user.getDate_created()) + " : " + email + " : " + pass);
        long passHashCode = Util.hashPass(Util.dateFormat(user.getDate_created()), email, pass);
        if (passHashCode != user.getPassword()) {
            notifyError(2, "Sai email hoặc mật khẩu", request, response);
        } else if (!user.isActive()) {
            System.out.println("Tai khoan user bi khoa");
            notifyError(2, "Tài khoản của bạn đã bị khóa", request, response);
//                request.getRequestDispatcher("user_page/Login.jsp").forward(request,response);
        } else {
            System.out.println("Vao success");
            successLogin(request, response, user);
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("logout").equalsIgnoreCase("true")) {

            deleteAvailableSession(request);
            HttpSession session = request.getSession();
            session.setAttribute("cart", new Cart());
            request.getRequestDispatcher("home").forward(request, response);
        }
    }

    private void enterLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("login").equalsIgnoreCase("user")) {
            //set status cho trang jsp de hieu la dang o trang thai nao
            //status = 1: đang nhap
            //status = 2: Sai tai khoan, co loi khac xay ra

            request.setAttribute("status", 1);
            request.getRequestDispatcher("user_page/Login.jsp").forward(request, response);
        }
        //neu login=admin thi chuyen den trang login cho dang nhap lai
        else if (request.getParameter("login").equalsIgnoreCase("admin") ||
                request.getParameter("login").equalsIgnoreCase("vendor")) {
            HttpSession session = request.getSession();
            if (session.getAttribute("user_id") != null) {
                int user_id = (int) session.getAttribute("user_id");
                System.out.println("Dang vao dayyyyyyyyyy admin vao admin");
//                    User user = LoadUser.loadUserById(user_id);
                int role_id = (int)session.getAttribute("role_id");
                System.out.println("Dang vao dayyyyyyyyyy admin vao admin: "+role_id);
                if ( role_id ==2 ||role_id == 3 || role_id == 4) {
                    request.getRequestDispatcher("handle-login?login=user").forward(request, response);
                }
            }

        }
    }

    private void handleForgetPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (Load_ForgetPass.loadForgetPassByEmail(request.getParameter("email_forget_pass")) != null) {
            notifyError(2, "Email đã đăng kí nhận mail thay đổi mật khẩu", request, response);
            return;
        }
        User user = LoadUser.loadAUserByEmail(request.getParameter("email_forget_pass"));

        if (user != null) {
            ForgetPass fp = new ForgetPass(user.getId(), user.getEmail(), user.getPassword());
            boolean succSave = Load_ForgetPass.saveForgetPass(fp);
            if (succSave) {
                String link = "http://localhost:8082/handle-login?conform-fp=true&key=" + fp.getKey_forget();
                String subject = "Lấy lại mật khẩu";
                String content = "Chào " + user.getName() + "!,"
                        + "\n Đây là link lấy lại mật khẩu! Link có thời hạn 3 ngày kể từ ngày nhận. Bấm vào để xác nhận\n"
                        + link;

                Mail.sendMail(content, subject, user.getEmail());

            }
        }
        notifyError(2, "Email đã được gửi, nếu email đã đăng kí, vui lòng kiểm tra email", request, response);
        return;
    }

    private boolean enterForgetPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        ForgetPass fp = Load_ForgetPass.loadForgetPassByKey(key);
        if (fp != null) {
            long diffInMillies = Math.abs(new Date().getTime() - fp.getDate_end().getTime());
            long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
            if (diff <= 3) {
                request.setAttribute("title", "Đổi mật khẩu");
                request.setAttribute("key", key);
                System.out.println("co vao day ne*********");
                request.getRequestDispatcher("user_page/change-forgot-password.jsp").forward(request, response);
                return true;
            }
        } else {
            notifyError(2, "Sai thông tin", request, response);
            return true;
        }
        return false;
    }

    private void forgetPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email-change-pass");
        String key = request.getParameter("key");
        System.out.println("Day la key: " + key);
        String pass = request.getParameter("new-pass");
        ForgetPass fp = Load_ForgetPass.loadForgetPassByEmailKey(email, key);
        if (fp != null) {
            LoadUser.changePassword(fp.getUser_id(), fp.getEmail(), pass);
            Load_ForgetPass.deleteForgetPassByKey(key);
            request.getRequestDispatcher("user_page/Login.jsp").forward(request, response);
            return;
        } else {
            notifyError(2, "Sai thông tin lấy lại mật khẩu!", request, response);
            return;
        }
    }

    public static void deleteAvailableSession(HttpServletRequest request) {
        if (request.getSession(false) != null) {
            request.getSession(false).invalidate();
        }
    }

    public static void successLogin(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("role_id") == null) {
            session.setAttribute("favourist", new FavouriteListMap(user.getId()));
            session.setAttribute("user_avatar", user.getAvatar());
            session.setAttribute("user_id", user.getId());
            session.setAttribute("user_name", user.getName());
            // them
            session.setAttribute("role_id", user.getRole_id());
            if(user.getRole_id() == 2) {
                session.setAttribute("supplier_id", Load_Supplier.loadSupplierIdWithUserId(user.getId()));
            }
            session.setAttribute("user_mail", user.getEmail());
            session.setAttribute("user_phone", user.getPhone());
            session.setAttribute("user_address", user.getAddress());
            Cart cart = new Cart(user.getId());
            List<Product> viewProducts = ProductEntity.loadViewProducts(user.getId());
            session.setAttribute("vp", viewProducts);
            session.setAttribute("cart", cart);

            System.out.println("Dan chuyen den home sau khi dang nhap");
            request.getRequestDispatcher("home").forward(request, response);
        }

        else {

            List<Notifications> listNotification= Notification_Con_DB.loadNotificationsFormSql("SELECT * FROM notifications where MONTH(date_created) = month(CURRENT_DATE) order by date_created DESC");
            session.setAttribute("Notifications",listNotification);

            int role_id = (int) session.getAttribute("role_id");
            if (role_id == 3 || role_id == 4) {
                response.sendRedirect("admin_page/dashboard");
            }else if(role_id == 2){
                listNotification= Notification_Con_DB.loadNotificationsFormSql("SELECT * FROM notifications where MONTH(date_created) = month(CURRENT_DATE) AND supplier_id= "+session.getAttribute("supplier_id")+ " order by date_created DESC");
                System.out.println("Gia tri supplier_id la:"+session.getAttribute("supplier_id"));
                session.setAttribute("Notifications",listNotification);
                response.sendRedirect("vendor_page/dashboard");
            }
        }

    }

    public static void notifyError(int status_id, String status_content, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status", status_id);
        request.setAttribute("status_content", status_content);
        request.getRequestDispatcher("user_page/Login.jsp").forward(request, response);
    }

}
