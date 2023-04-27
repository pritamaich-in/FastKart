// add items to cart
function addToCart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		// no cart yet
		let products = [];
		let product = {
			productId: pid,
			productName: pname,
			productPrice: price,
			quantity: 1
		};
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		// console.log("Product is added for the first time");
		showToast('Product is added to cart');
	} else {
		// cart is already present
		let pcart = JSON.parse(cart); // pcart is a product array
		let oldProduct = pcart.find((item) => item.productId == pid); // find method will return the reference to a matching product object 

		if (oldProduct) {
			// product is already present, we have to increase quantity
			oldProduct.quantity += 1;
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("Similar Product already available, increasing quantity");
			showToast('Product quantity is increased');
		} else {
			let product = {
				productId: pid,
				productName: pname,
				productPrice: price,
				quantity: 1
			};
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("A new product is added in cart");
			showToast('Product is added to cart');
		}
	}
	updateCart();
}

// update cart 
function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log(`Cart is empty`);
		$(".cart-items").html("0");
		// document.getElementsByClassName("cart-items")[0].innerHTML = "0";
		$(".cart-body").html(`<h3>Cart does not have any item</h3>`);
		$(".checkout-btn").addClass('disabled');
	} else {
		console.log(cart);

		$(".cart-items").html(`${cart.length}`);
		$(".checkout-btn").addClass('');
		let table = `
		<table class='table'>
			<thead class='thead-light'>
				<tr>
					<th>Item Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total Price</th>
					<th>Action</th>
				</tr>
			</thead>
		`;

		let totalPrice = 0;
		cart.map((item) => {
			table += `
			<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.quantity}</td>
					<td>${item.quantity * item.productPrice}</td>
					<td><button onclick="deleteItemFromCart(${item.productId})" class="btn btn-danger btn-sm">Remove</button></td>
				</tr>
			`;
			totalPrice += (item.quantity * item.productPrice);
		});

		table += `
			<tr>
			<td colspan='5' class="text-right" style="border: 1px red solid;">Total Price : ${totalPrice}</td>
			</tr>
		</table>`;

		$(".cart-body").html(table);
	}
}

//document.addEventListener('DOMContentLoaded', ()=> {
//updateCart();
//}, false);

function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newCart = cart.filter((item) => item.productId != pid);
	localStorage.setItem('cart', JSON.stringify(newCart));

	showToast('Product is removed from cart');
	updateCart();
}

function showToast(toastMessage) {
	// Get the snackbar DIV
	var x = document.getElementById("snackbar");

	// Add the "show" class to DIV
	x.className = "show";
	x.innerText = toastMessage;

	// After 3 seconds, remove the show class from DIV
	setTimeout(() => { x.className = x.className.replace("show", ""); }, 2000);
}

$(document).ready(() => { updateCart(); });