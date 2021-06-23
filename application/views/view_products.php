<div class="products-wrapper">
    <h1 class="title">Каталог товаров</h1>
    <div class="options">
        <ul class="js-sort">
            <li class="js-sort-price" data-order-by="price">Цена <i class="fa <?=$data["sorting"]["price"] ?: ''?>"></i></li>
            <li class="js-sort-name" data-order-by="name">Название <i class="fa <?=$data["sorting"]["name"] ?: ''?>"></i></li>
            <li class="js-sort-reviews" data-order-by="reviews_count">Кол-во отзывов <i class=" fa <?=$data["sorting"]["reviews_count"] ?: ''?>"></i></li>
        </ul>
    </div>
    <div class="products-container">
        <?php foreach ($data["products"] as $product): ?>
            <?php include "view_product_card.php" ?>
        <?php endforeach; ?>
    </div>
    <div class="pagination">
        <ul>
            <li id="prev"   class="nav js-prev <?=$data["pagination"]["hasPrev"] ?: 'disabled' ?>" > < Назад </li>
            <li             class="nav page js-current"                                            > <?=$data["pagination"]["current"]?> </li>
            <li id="next"   class="nav js-next <?=$data["pagination"]["hasNext"] ?: 'disabled' ?>" > Вперед > </li>
        </ul>
    </div>
    <form class="js-pag-form" action="products" method="get">
        <input type="hidden" name="page" class="js-pag-form-page">
        <input type="hidden" name="order_by" class="js-pag-form-order-by" value="<?=$data["sorting"]["order_by"]?>">
        <input type="hidden" name="order_type" class="js-pag-form-order-type" value="<?=$data["sorting"]["order_type"]?>">
    </form>
    <!--<div class="footer"></div>-->
</div>