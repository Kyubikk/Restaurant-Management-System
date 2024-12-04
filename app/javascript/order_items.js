document.addEventListener("turbolinks:load", function() {
    const orderItemsContainer = document.getElementById("order-items-list");
    const totalAmountField = document.getElementById("total_amount");

    // Thiết lập giá trị ban đầu là 0
    totalAmountField.value = "0.00";

    // Thêm item mới khi nhấn nút "Add Item"
    document.getElementById("add-order-item").addEventListener("click", function(e) {
        e.preventDefault();
        let newItem = document.createElement("div");
        newItem.innerHTML = orderItemsContainer.querySelector("div").outerHTML; // Sao chép phần tử đầu tiên
        
        // Thêm item vào container
        orderItemsContainer.appendChild(newItem);
        
        // Cập nhật lại ID cho các trường input để Rails có thể nhận diện
        updateFormFields();
    });

    // Cập nhật giá khi thay đổi quantity hoặc menu_item_id
    orderItemsContainer.addEventListener("change", function(event) {
        let totalAmount = 0;
        const quantityInputs = document.querySelectorAll("input[name$='[quantity]']");
        const priceInputs = document.querySelectorAll("input[name$='[price]']");
        
        quantityInputs.forEach((input, index) => {
            const quantity = parseFloat(input.value) || 0;
            const price = parseFloat(priceInputs[index].value) || 0;
            totalAmount += quantity * price;
        });

        // Cập nhật tổng tiền
        totalAmountField.value = totalAmount.toFixed(2);
    });

    // Cập nhật giá khi chọn món ăn
    orderItemsContainer.addEventListener("change", function(event) {
        if (event.target.name && event.target.name.includes("[menu_item_id]")) {
            const itemIndex = Array.from(event.target.closest("div").parentElement.children).indexOf(event.target.closest("div"));
            const selectedItemId = event.target.value;
            const priceInput = document.querySelectorAll("input[name$='[price]']")[itemIndex];

            fetch(`/menu_items/${selectedItemId}`)
                .then(response => response.json())
                .then(data => {
                    priceInput.value = data.price; // Cập nhật giá vào ô input
                });
        }
    });

    // Hàm cập nhật lại ID cho các trường input để Rails có thể nhận diện
    function updateFormFields() {
        const inputs = orderItemsContainer.querySelectorAll("input, select");
        inputs.forEach(input => {
            const name = input.name;
            input.name = name.replace(/\[\d+\]/, `[${orderItemsContainer.children.length - 1}]`);
        });
    }
});
