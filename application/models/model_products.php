<?php


class ModelProducts extends Model {

    public function getProducts($from, $to, $order_by, $order_type) {
        $pdo = DB::get_instance();

        $sql = "SELECT * FROM ( SELECT count(*) as reviews_count, products.id FROM products, reviews where products.id = reviews.product_id GROUP BY products.id) as t1
                  RIGHT JOIN (SELECT * FROM products) as t2 using(id)
                  ORDER BY $order_by $order_type 
                  LIMIT $from, $to ";
        $data = $pdo->query($sql)->fetchAll();
        return $data;
    }
    public function getProductsCount() {
        $pdo = DB::get_instance();

        $sql = "SELECT count(*) FROM products";
        $count = $pdo->query($sql)->fetch();
        return $count;
    }

    public function add($name, $desc, $price){
        $pdo = DB::get_instance();

        $allowed = ["name", "description", "price"];
        $values = [];
        $sql = "INSERT INTO products SET ".DB::pdoSet($allowed, $values, ["name" => $name,
                                                                          "description" => $desc,
                                                                          "price" => $price]);
        $stm = $pdo->prepare($sql);
        return $stm->execute($values);
    }

    public function getProduct($id) {
        $pdo = DB::get_instance();

        $sql = "SELECT * FROM products WHERE id = $id";
        $data = $pdo->query($sql)->fetch();
        return $data;
    }
}