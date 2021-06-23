<?php


class ModelReviews extends Model {

    public function get_reviews($id, $published){
        $pdo = DB::get_instance();

        $stmt = $pdo->prepare("SELECT * FROM reviews WHERE is_published=? and product_id=?");
        $stmt->execute([$published, $id]);
        $data = $stmt->fetchAll();
        return $data;
    }

    public function add($text, $product_id, $date){
        $pdo = DB::get_instance();

        $allowed = ["text", "product_id", "date"];
        $values = [];
        $sql = "INSERT INTO reviews SET ".DB::pdoSet($allowed, $values, ["text" => $text,
                "product_id" => $product_id,
                "date" => $date]);
        $stm = $pdo->prepare($sql);
        $stm->execute($values);
        return $values;
    }
}