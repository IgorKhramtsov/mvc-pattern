<?php


class ModelAdmin extends Model {

    public function checkTables() {
        $pdo = DB::get_instance();

        $data["tables"]["products"] = true;
        $data["tables"]["reviews"] = true;

        $stm = $pdo->query("SHOW TABLES LIKE 'products'");
        if($stm->fetch() === false)
            $data["tables"]["products"] = false;

        $stm = $pdo->query("SHOW TABLES LIKE 'reviews'");
        if($stm->fetch() === false)
            $data["tables"]["reviews"] = false;

        foreach ($data["tables"] as $table)
            if (!$table)
                $data["errors"] = true;

        return $data;
    }

    public function fix_tables() {
        $pdo = DB::get_instance();
        $sql_products = "CREATE TABLE IF NOT EXISTS products(
                          product_id INT AUTO_INCREMENT,
                          name VARCHAR(255) NOT NULL,
                          price DECIMAL(15, 2) NOT NULL,
                          description TEXT NOT NULL,
                          PRIMARY KEY(product_id)
                          );";
        $pdo->exec($sql_products);

        $sql_reviews = "CREATE TABLE IF NOT EXISTS reviews(
                         review_id INT AUTO_INCREMENT,
                         date DATE NOT NULL,
                         text TEXT NOT NULL,
                         is_published BOOL DEFAULT 0,
                         product_id INT NOT NULL,
                         PRIMARY KEY(review_id),
                         FOREIGN KEY(product_id) REFERENCES products(product_id)
                         );";
        $pdo->exec($sql_reviews);
    }

    public function get_all_reviews($published) {
        $pdo = DB::get_instance();

        $stmt = $pdo->prepare("SELECT * FROM reviews WHERE is_published=?");
        $stmt->execute([$published]);
        $data = $stmt->fetchAll();
        return $data;
    }
    public function moderate_review($id, $action)
    {
        $pdo = DB::get_instance();

        if($action === "delete")  {
            $stmt = $pdo->prepare("DELETE FROM reviews WHERE review_id=?");
            $stmt->bindValue(1, $id, PDO::PARAM_INT);
            $stmt->execute();
        } else {
            $stmt = $pdo->prepare("UPDATE reviews SET is_published=1 WHERE review_id=?");
            $stmt->bindValue(1, $id, PDO::PARAM_INT);
            $stmt->execute();
        }
    }
}