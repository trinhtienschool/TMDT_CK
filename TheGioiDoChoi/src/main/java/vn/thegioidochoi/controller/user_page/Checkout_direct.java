package vn.thegioidochoi.controller.user_page;

import vn.thegioidochoi.model.Product.Product;
import vn.thegioidochoi.model.Product.ProductEntity;
import vn.thegioidochoi.model.user.Cart;
import vn.thegioidochoi.model.user.Cart_item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
            if(address !=null) {
                String[] arr = separatedAddress(address);
                if (arr.length == 4) {
                    request.setAttribute("province", arr[0]);
                    request.setAttribute("district", arr[1]);
                    request.setAttribute("sd", arr[2]);
                    request.setAttribute("detail", arr[3]);
                    System.out.println("co vo&&&&&&&&&&&&&&&&&");
                }
            }

        }
        Cart cart = (Cart) session.getAttribute("cart");

        double price = 0;
        double price_shipment = 0;
        double total_price = 0;
//        int typeWeight = 1;
        List<Product>products = new ArrayList<>();

        if (request.getParameter("fast-checkout") != null) {
            int pro_id = Integer.parseInt(request.getParameter("pro_id"));
            Product product = ProductEntity.loadProductById(pro_id);
            if (product.isIs_sale())
                price = product.getPrice_sale();
            else price = product.getPrice();
//            typeWeight = product.getType_weight();
            session.setAttribute("fast-checkout", true);
//            session.setAttribute("type_weight", typeWeight);
           price_shipment=20000;
            session.setAttribute("pro_id", pro_id);
            session.setAttribute("price", product.getPrice());
            products.add(product);

        } else {
            price = cart.getPriceSaled() != 0 ? cart.getPriceSaled() : cart.getTotalPrice();
//            typeWeight = cart.getMaxTypeWeight();
            cart.setTotalPriceCheckout(total_price);
            Set<String> vendors = new HashSet<String>();
            for(Cart_item item : cart.getProducts().values()) {
                vendors.add(item.getVendor_name());
            }
            price_shipment = vendors.size()*20000;

            for(Cart_item item:cart.getProducts().values()){
                Product product_temp = new Product();
                product_temp.setName(item.getName());
                product_temp.setPrice(item.getPrice());
                product_temp.setPrice_sale(item.getPrice_sale());
                products.add(product_temp);
            }

            System.out.println("Fee shippppppppppppppppppppp: " + price_shipment);

        }
        total_price = price + price_shipment;
        session.setAttribute("products", products);
        session.setAttribute("total-price", total_price);
        request.setAttribute("price", price);
        request.setAttribute("fee_ship", price_shipment);
        session.setAttribute("fee_ship", price_shipment);
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
