<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết sản phẩm</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productDetail.css?v=${System.currentTimeMillis()}"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="product-detail-container">
            <div class="product-detail-image">
                <img src="image/logo/logoIMG.png" alt="${product.name}"/>
            </div>
            <div class="product-detail-info">
                <h2 class="product-name">${product.name}</h2>
                <p class="product-description">${product.description}</p>
                <p class="product-price">
                    <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VNĐ
                </p>
                <ul class="product-attributes">
                    <li><strong>Thương hiệu:</strong> ${brand}</li>
                    <li><strong>Kiểu dáng:</strong> ${style}</li>
                </ul>

                <!-- Chọn màu -->
                <div class="product-colors">
                    <p><strong>Màu sắc:</strong></p>
                    <c:forEach var="color" items="${colorList}">
                        <span class="color-option" data-color-id="${color.colorId}">${color.colorName}</span>
                    </c:forEach>
                </div>

                <!-- Chọn size -->
                <div class="size-select">
                    <p><strong>Kích thước:</strong></p>
                    <c:forEach var="size" items="${sizeList}">
                        <div class="size-option" data-size-id="${size.sizeId}">${size.sizeName}</div>
                    </c:forEach>
                </div>

                <!-- Hiển thị số lượng -->
                <div class="quantity-wrapper disabled" id="quantityWrapper">
                    <p><strong>Số lượng:</strong></p>
                    <div class="quantity-box">
                        <button type="button" class="qty-btn" id="btnMinus">−</button>
                        <input type="text" id="inputQuantity" value="1" readonly>
                        <button type="button" class="qty-btn" id="btnPlus">+</button>
                    </div>
                    <div class="stock-info" id="stockInfo"></div>
                </div>

                <!-- Hidden fields -->
                <form action="addtocart" method="get" onsubmit="return validateForm();">
                    <input type="hidden" name="productId" value="${product.productId}">
                    <input type="hidden" name="color" id="colorInput">
                    <input type="hidden" name="size" id="sizeInput">
                    <input type="hidden" name="quantity" id="quantityInput" value="1">
                    <div class="action-buttons">
                        <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <button type="submit" class="btn">
                                    <i class="fas fa-shopping-basket"></i> Thêm vào giỏ hàng
                                </button>
                                <button type="button" class="btn" style="background:#f56c00">Mua ngay</button>
                            </c:when>
                            <c:otherwise>
                                <p>Bạn cần <a href="login.jsp">đăng nhập</a> để mua sản phẩm.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script>
            let selectedColorId = null;
            let selectedSizeId = null;
            let maxStock = 0;

            document.addEventListener('DOMContentLoaded', function () {
                const colorOptions = document.querySelectorAll('.color-option');
                const sizeOptions = document.querySelectorAll('.size-option');
                const quantityWrapper = document.getElementById('quantityWrapper');
                const inputQuantity = document.getElementById('inputQuantity');
                const stockInfo = document.getElementById('stockInfo');
                const btnMinus = document.getElementById('btnMinus');
                const btnPlus = document.getElementById('btnPlus');
                const colorInput = document.getElementById('colorInput');
                const sizeInput = document.getElementById('sizeInput');
                const quantityInput = document.getElementById('quantityInput');
                const productId = "${product.productId}";

                function updateQuantityControls() {
                    const qty = parseInt(inputQuantity.value);
                    btnMinus.disabled = qty <= 1;
                    btnPlus.disabled = qty >= maxStock;
                }

                btnMinus.addEventListener('click', () => {
                    let qty = parseInt(inputQuantity.value);
                    if (qty > 1) {
                        inputQuantity.value = qty - 1;
                        quantityInput.value = inputQuantity.value;
                        updateQuantityControls();
                    }
                });

                btnPlus.addEventListener('click', () => {
                    let qty = parseInt(inputQuantity.value);
                    if (qty < maxStock) {
                        inputQuantity.value = qty + 1;
                        quantityInput.value = inputQuantity.value;
                        updateQuantityControls();
                    }
                });

                function fetchQuantity() {
                    if (selectedColorId && selectedSizeId) {
                        fetch(`getquantity?productId=${productId}&colorId=${selectedColorId}&sizeId=${selectedSizeId}`)
                                .then(response => response.json())
                                .then(data => {
                                    maxStock = data.quantity || 0;
                                    if (maxStock > 0) {
                                        inputQuantity.value = 1;
                                        quantityInput.value = 1;
                                        stockInfo.innerText = `${maxStock} sản phẩm có sẵn`;

                                        quantityWrapper.classList.remove('disabled');
                                        updateQuantityControls();
                                    } else {
                                        stockInfo.innerText = `Hết hàng cho tổ hợp này`;
                                        inputQuantity.value = 0;
                                        quantityInput.value = 0;

                                        quantityWrapper.classList.add('disabled');
                                    }
                                });
                    } else {
                        stockInfo.innerText = `Vui lòng chọn màu và kích thước`;
                        inputQuantity.value = 0;
                        quantityInput.value = 0;
                        quantityWrapper.classList.add('disabled');
                    }
                }

                colorOptions.forEach(option => {
                    option.addEventListener('click', function () {
                        colorOptions.forEach(opt => opt.classList.remove('active'));
                        this.classList.add('active');
                        selectedColorId = this.dataset.colorId;
                        colorInput.value = selectedColorId;

                        fetchQuantity(); // Luôn gọi
                    });
                });

                sizeOptions.forEach(option => {
                    option.addEventListener('click', function () {
                        sizeOptions.forEach(opt => opt.classList.remove('active'));
                        this.classList.add('active');
                        selectedSizeId = this.dataset.sizeId;
                        sizeInput.value = selectedSizeId;

                        fetchQuantity(); // Luôn gọi
                    });
                });
            });

            function validateForm() {
                if (!selectedColorId || !selectedSizeId || maxStock === 0) {
                    alert("Vui lòng chọn đầy đủ màu sắc, kích thước và đảm bảo còn hàng.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html> 