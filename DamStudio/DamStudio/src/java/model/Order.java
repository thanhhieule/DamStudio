package model;

import java.math.BigDecimal;
import java.util.Date;

public class Order {

    private int orderId;
    private String orderDeliverCode;
    private Integer userId; // Integer vì có thể null
    private String orderName;
    private String orderEmail; // Đã sửa từ orderEmai thành orderEmail
    private String orderPhone;
    private BigDecimal totalPrice; // Sử dụng BigDecimal cho tiền tệ
    private String note;
    private int saleId;
    private int shipperId;
    private Date createDate; // Sử dụng Date cho ngày tháng
    private String shippingAddress;
    private int orderStatus;
    private int payMethod;
    private int voucherId;

    public Order() {
    }

    public Order(int orderId, String orderDeliverCode, Integer userId, String orderName, String orderEmail, String orderPhone, BigDecimal totalPrice, String note, int saleId, int shipperId, Date createDate, String shippingAddress, int orderStatus, int payMethod, int voucherId) {
        this.orderId = orderId;
        this.orderDeliverCode = orderDeliverCode;
        this.userId = userId;
        this.orderName = orderName;
        this.orderEmail = orderEmail;
        this.orderPhone = orderPhone;
        this.totalPrice = totalPrice;
        this.note = note;
        this.saleId = saleId;
        this.shipperId = shipperId;
        this.createDate = createDate;
        this.shippingAddress = shippingAddress;
        this.orderStatus = orderStatus;
        this.payMethod = payMethod;
        this.voucherId = voucherId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderDeliverCode() {
        return orderDeliverCode;
    }

    public void setOrderDeliverCode(String orderDeliverCode) {
        this.orderDeliverCode = orderDeliverCode;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getOrderEmail() {
        return orderEmail;
    }

    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail;
    }

    public String getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getShipperId() {
        return shipperId;
    }

    public void setShipperId(int shipperId) {
        this.shipperId = shipperId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public int getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(int payMethod) {
        this.payMethod = payMethod;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

}
