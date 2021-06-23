<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title><?php echo $title ?></title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&amp;subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="/build/css/app.css">
    <script src="/build/js/libs.js"></script>
    <script src="/build/js/app.js"></script>
</head>
<body>
<?php include 'application/views/'.$content_file; ?>
<div class="notify">
    <h2 class="title"></h2>
    <p class="message"></p>
</div>
</body>
</html>