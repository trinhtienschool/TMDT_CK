package vn.thegioidochoi.controller.admin_page;

import vn.thegioidochoi.model.Product.Withdraw;
import vn.thegioidochoi.Dao.Load_Supplier;
import vn.thegioidochoi.model.util.Util;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Withdraw_direct", value = {"/admin_page/withdraw","/vendor_page/withdraw"})
public class Withdraw_direct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "withdraw");
        request.setAttribute("title", "Withdraw");
        //enter withdraw page
        withdrawVendor(request, response);
    }

    private void withdrawVendor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("role_id")!=null){
            if((int)session.getAttribute("role_id")==3 || (int)session.getAttribute("role_id")==4){
                System.out.println("Dang vao withdrawVendor 333333333333334444444444444");
                if(request.getParameter("action") !=null){
                    int w_id = Integer.parseInt(request.getParameter("id"));
                    int status = Integer.parseInt(request.getParameter("status"));
                    Withdraw.updateWithdraw(status,w_id);
                }
                List<Withdraw> withdraws = Withdraw.loadWithdraws("%");
                System.out.println(withdraws.size());
                request.setAttribute("withdraws", withdraws);
                request.getRequestDispatcher("withdraw.jsp").forward(request, response);
                return;
            }else{
                int supplier_id = (int) session.getAttribute("supplier_id");
                if(request.getParameter("withdraw-amount") !=null){
                    String current_balance = request.getParameter("current-balance");
                    System.out.println(current_balance);
                    current_balance = current_balance.replaceAll("\\D", "");
                    double current_amount= Double.parseDouble(current_balance);

                    String withdraw = request.getParameter("withdraw-amount");
                    System.out.println(withdraw);
                    withdraw = withdraw.replaceAll("\\D", "");
                    double withdraw_amount = Double.parseDouble(withdraw);
                    double remain_balance = current_amount - withdraw_amount;
                    String paypal_email = request.getParameter("paypal-email");
                    int user_id = (int) session.getAttribute("user_id");
                    Withdraw.insertWithdraw(new Withdraw(user_id, supplier_id, current_amount, withdraw_amount, remain_balance, paypal_email, 0));
                }
                Withdraw lastWithdraw = Withdraw.loadLastWithdraw(supplier_id);
                String date_created = lastWithdraw.getDate_created()==null?"2018-01-01": Util.dateFormat(lastWithdraw.getDate_created());
                long current_balance = Load_Supplier.sumOf("select SUM((o.total_price)*(100-o.commission_rate)/100) from `order` o join supplier s on o.supplier_id = s.id where supplier_id= "+supplier_id+" and o.date_created >'"+date_created+"'");
                System.out.println("current_balance: "+current_balance);
                current_balance += lastWithdraw.getRemain_balance();
                System.out.println("remain_balance: "+lastWithdraw.getRemain_balance());
                request.setAttribute("current_balance", current_balance);
                List<Withdraw> withdraws = Withdraw.loadWithdraws(supplier_id+"");
                request.setAttribute("withdraws", withdraws);
                request.getRequestDispatcher("withdraw.jsp").forward(request, response);
            }
        }

    }
}
