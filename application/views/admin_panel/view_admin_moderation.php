<h1 class="title">Модерация</h1>
<ul>
    <?php foreach ($reviews as $review): ?>
        <li>
            <span class="product_id">product_id: <?=$review["product_id"]?></span>
            <span class="date"><?=$review["created_at"]?></span>
            <p class="text"><?=$review["text"]?></p>
            <form action="/admin/moderate" method="post" class="js-form-reviews">
                <input type="hidden" name="review_id" value="<?=$review["review_id"]?>">
                <button class="button publish js-publish" name="action" value="publish">Опубликовать</button>
                <button class="button delete js-delete" name="action" value="delete">Удалить</button>
            </form>
        </li>
    <?php endforeach; ?>
</ul>