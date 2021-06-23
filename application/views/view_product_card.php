<a href="products/id/<?=$product["id"]?>" class="product-card">
    <div class="head">
        <div class="reviews">
            <i class="fa fa-comment"></i> <span class="reviews-count"><?=$product["reviews_count"] ?: 0?></span>
        </div>
        <h1 class="title"><?=$product["name"]?></h1>
    </div>
    <img src="../../images/product_2.jpg">
    <div class="price-block">
        <span class="price"><?=$product["price"]?></span> <span>Руб.</span>
    </div>
    <p class="description"><?=$product["description"]?></p>
</a>