<?php

class ControllerReviews extends Controller {

     public function __construct() {
        $this->model = new ModelReviews();
        parent::__construct();
    }

    public function action_published($id) {
         $data = $this->model->get_reviews($id, true);
         $this->view->generate("view_reviews.php", $data);
    }

    public function action_unpublished($id) {
        $data = $this->model->get_reviews($id, false);
        $this->view->generate("view_reviews.php", $data);
    }

    public function action_add() {
        header('Content-Type: application/json');
        $response["message"] = "";
        $response["description"] = "";
        $response["status"] = "error";

        if (!isset($_POST["text"]) || empty($_POST["text"]))
            $response["errors"]["name"] = "Пустой отзыв.";
        if (!isset($_POST["product_id"]) || empty($_POST["product_id"]))
            $response["errors"]["product_id"] = "Не указан id.";
        $_date = getdate();
        $date = $_date["year"].".".$_date["mon"].".".$_date["mday"];

        $p_id = intval($_POST["product_id"]);
        if ($p_id <= 0)
            $response["errors"]["product_id"] = "Неверно указан id.";

        if (isset($response["errors"])) {
            $response["message"] = "Ошибка.";
            $response["status"] = "error";
        } else {
            if ($this->model->add($_POST["text"], $p_id, $date)) {
                $response["message"] = "Отзыв добавлен!";
                $response["status"] = "success";
            }
            else {
                $response["message"] = "Отзыв не добавлен!";
                $response["status"] = "error";
            }
        }

        echo json_encode($response);
    }
}