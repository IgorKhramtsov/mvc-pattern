<h1 class="title">Статус</h1>
<ul>
    <?php foreach ($data["tables"] as $key => $value): ?>
        <li class="<?= !$value ? error : '' ?>">Таблица <?=$key?> <b><?= $value ? "OK" : "ERROR" ?></b></li>
    <?php endforeach; ?>
    <li> <button class="button js-table-fix " <?= isset($data["errors"]) && $data["errors"] ? "" : "disabled" ?> >Починить</button> </li>
</ul>