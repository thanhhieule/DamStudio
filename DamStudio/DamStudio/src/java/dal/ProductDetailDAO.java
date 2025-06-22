package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDetailDAO extends DBContext {

    public int getQuantityByProductColorSize(String productId, int colorId, int sizeId) {
        String sql = "SELECT quantity FROM detail_product WHERE productId = ? AND colorId = ? AND sizeId = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, productId);
            ps.setInt(2, colorId);
            ps.setInt(3, sizeId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        ProductDetailDAO pddao = new ProductDetailDAO();
        int q = pddao.getQuantityByProductColorSize("ST0001", 1, 1);
        System.out.println(q);
    }
}
