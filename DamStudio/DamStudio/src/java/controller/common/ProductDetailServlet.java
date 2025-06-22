package controller.common;

import dal.AccountDAO;
import dal.BrandDAO;
import dal.ColorDAO;
import dal.FeedbackDAO;
import dal.ProductDAO;
import dal.ProductDetailDAO;
import dal.SizeDAO;
import dal.StyleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Color;
import model.Feedback;
import model.Product;
import model.Size;

public class ProductDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String productId = request.getParameter("productId");
    if (productId == null || productId.trim().isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu productId");
        return;
    }

    try {
        ColorDAO cdao = new ColorDAO();
        ProductDAO pdao = new ProductDAO();
        BrandDAO bdao = new BrandDAO();
        StyleDAO sdao = new StyleDAO();
        SizeDAO sizedao = new SizeDAO();
        FeedbackDAO fdao = new FeedbackDAO();
        AccountDAO adao = new AccountDAO();
        ProductDetailDAO pddao = new ProductDetailDAO();

        Product pro = pdao.getProductById(productId);
        if (pro == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sản phẩm");
            return;
        }

        List<Color> color = cdao.getColorOfProduct(productId);
        List<Size> sizeList = sizedao.getAllSizeOfProduct(productId);
        List<Feedback> feedback = (request.getParameter("rate") == null)
                ? fdao.getFeedbackByProductId(productId)
                : fdao.getFeedbackByRate(productId, Integer.parseInt(request.getParameter("rate")));

        String brand = bdao.getBrandById(pro.getBrandId());
        String style = sdao.getStyleNameByStyleId(pro.getStyleId());
        Size size1 = sizedao.getSizeOfProduct(productId);
        List<Account> listAcc = adao.getUserNameByProductId(productId);
        List<Product> pro2 = pdao.getProductByPrice(pro.getPrice());
        int rateProduct = fdao.getRateProduct(productId);

        request.setAttribute("product", pro);
        request.setAttribute("colorList", color);
        request.setAttribute("brand", brand);
        request.setAttribute("style", style);
        request.setAttribute("sizeOfProduct1", size1);
        request.setAttribute("sizeList", sizeList);
        request.setAttribute("feedback", feedback);
        request.setAttribute("acc", listAcc);
        request.setAttribute("rateProduct", rateProduct);
        request.setAttribute("pro2", pro2);

        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
    } catch (Exception ex) {
        ex.printStackTrace(); // In ra log
        throw new ServletException("Lỗi khi xử lý sản phẩm: " + ex.getMessage(), ex);
    }
}

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
