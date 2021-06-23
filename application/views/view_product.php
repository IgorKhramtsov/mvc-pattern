<div class="product">
    <h1 class="title"><?=$data["name"]?></h1>
    <img src="../../images/product_2.jpg">

    <p class="description"><?=$data["description"]?></p>
    <div>
        <span class="price"><?=$data["price"]?> Руб.</span>
    </div>
    <div class="reviews-container">
        <div class="add-review">
            <h1>Добавить отзыв</h1>
            <form action="/reviews/add" method="post" class="js-form">
                <div class="textarea-wrapper">
                    <div class="inp">
                        <textarea name="text" rows="5"></textarea>
                    </div>
                </div>
                <input type="hidden" name="id" value="<?=$data["id"]?>">
                <button type="submit" class="button">Отправить</button>
            </form>
        </div>
        <div class="reviews">
            <?php include "view_reviews.php"?>
        </div>
    </div>
</div>