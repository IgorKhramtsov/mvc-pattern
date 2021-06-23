<h1 class="title">Добавить товар</h1>
<form class="js-form" action="products/add" method="post" novalidate>
    <div class="row">
        <div class="inp">
            <input id="name" type="text" name="name" required>
            <label for="name">Название</label>
        </div>
        <div class="inp right">
            <input id="price"  name="price" required>
            <label for="price">Цена (руб.)</label>
        </div>
    </div>
    <div class="row">
        <div class="inp desc">
            <textarea id="descritpion" name="description" required></textarea>
            <label for="descritpion">Описание</label>
        </div>
    </div>
    <button type="submit" class="button right">Добавить</button>
</form>