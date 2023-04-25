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
		console.log("Product is added for the first time");
	} else {
		// cart is already present
		let pcart = JSON.parse(cart); // pcart is a product array
		let oldProduct = pcart.find((item) => item.productId == pid); // find method will return the reference to a matching product object 
		
		if (oldProduct) {
			// product is already present, we have to increase quantity
			oldProduct.quantity += 1;
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Similar Product already available, increasing quantity");
		} else {
			let product = {
				productId: pid,
				productName: pname,
				productPrice: price,
				quantity: 1
			};
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("A new product is added in cart");
		}
	}
}