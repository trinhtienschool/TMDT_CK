package vn.thegioicaycanh.controller.user_page;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.user.Cart;
import vn.thegioicaycanh.model.util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/checkout")
public class Checkout_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page_menu", "null");
        request.setAttribute("title", "Thanh toán");
        if (request.getAttribute("type") == null)
            request.setAttribute("type", "null");
        HttpSession session = request.getSession();

        if (session.getAttribute("user_id") != null) {
            String address = (String) session.getAttribute("user_address");
            String[] arr = separatedAddress(address);
            if (arr.length == 4) {
                request.setAttribute("province", arr[0]);
                request.setAttribute("district", arr[1]);
                request.setAttribute("sd", arr[2]);
                request.setAttribute("detail", arr[3]);
                System.out.println("co vo&&&&&&&&&&&&&&&&&");
            }


        }
        Cart cart = (Cart) session.getAttribute("cart");

        double price = 0;
        double price_shipment = 0;
        double total_price = 0;
        int typeWeight = 0;

        if (request.getParameter("fast-checkout") != null) {
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            Product product = ProductEntity.loadProductById(pro_id);
            if (product.isIs_sale())
                price = product.getPrice_sale();
            else price = product.getPrice();
            typeWeight = product.getType_weight();
            session.setAttribute("fast-checkout", true);
            session.setAttribute("type_weight", typeWeight);
            session.setAttribute("pro_id", pro_id);
            session.setAttribute("price", product.getPrice());

        } else {
            price = cart.getPriceSaled() != 0 ? cart.getPriceSaled() : cart.getTotalPrice();
            typeWeight = cart.getMaxTypeWeight();
            cart.setTotalPriceCheckout(total_price);
        }

        if (typeWeight == 1) price_shipment = 10000;
        else if (typeWeight == 2) price_shipment = 20000;
        else if (typeWeight == 3) price_shipment = 50000;
        else if (typeWeight == 4) price_shipment = 70000;
        total_price = price + price_shipment;

        session.setAttribute("total-price", total_price);
        request.setAttribute("price", price);
        request.setAttribute("fee_ship", price_shipment);
        request.setAttribute("total_price", total_price);

        request.getRequestDispatcher("user_page/checkout.jsp").forward(request, response);
    }

    public String[] separatedAddress(String address) {
        String[] arr = address.split(",");
        String[] result = new String[4];
        //result[0]: tinh
        //result[1]: huyen
        //result[2]: phuong
        //result[3]: chi tiet
        result[0] = arr[arr.length - 1];
        result[1] = arr[arr.length - 2];
        result[2] = arr[arr.length - 3];
        result[3] = "";
        int i = 4;
        while (arr.length - i >= 0) {
            result[3] += arr[arr.length - i];
            i++;
        }
        return result;
    }
}
