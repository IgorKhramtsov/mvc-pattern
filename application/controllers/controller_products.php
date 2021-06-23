<?php
include __DIR__."/controller_reviews.php";
include __DIR__."/../models/model_reviews.php";

class ControllerProducts extends Controller {

    public function __construct() {
        $this->model = new ModelProducts();
        parent::__construct();
    }

    function action_index() {
        $data["title"] = "Каталог товаров";
        $products_in_page = 6;
        if (isset($_GET["page"])) {
            $current_page = max(1, intval($_GET["page"]));
        } else {
            $current_page = 1;
        }

        $order_by = "name";
        $order_type = "ASC";
        if(isset($_GET["order_by"])) {
            switch ($_GET["order_by"]) {
                case "price": $order_by = "price"; break;
                case "reviews_count": $order_by = "reviews_count"; break;
                default: $order_by = "name";
            }
        }
        if(isset($_GET["order_type"])) {
            switch ($_GET["order_type"]) {
                case "DESC": $order_type = "DESC"; break;
                default: $order_type = "ASC";
            }
        }
        $data["sorting"][$order_by] = $order_type == "ASC" ? "fa-sort-up" : "fa-sort-down";
        $data["sorting"]["order_by"] = $order_by;
        $data["sorting"]["order_type"] = $order_type;

        $from = ($current_page - 1) * $products_in_page;
        //$to = ($current_page * $products_in_page) + 1;
        $data["products"] = $this->model->getProducts($from, $products_in_page + 1, $order_by, $order_type);

        $count = count($data["products"]);
        if($count <= $products_in_page )
            $data["pagination"]["hasNext"] = false;
        else {
            $data["pagination"]["hasNext"] = true;
            unset($data["products"][$count - 1]);
        }

        if ($current_page > 1) {
            $data["pagination"]["hasPrev"] = true;
        } else {
            $data["pagination"]["hasPrev"] = false;
        }

        $data["pagination"]["current"] = $current_page;

        $this->view->generate("view_products.php", $data);
    }

    function action_id($id) {
        $_id = intval($id);
        $data = $this->model->getProduct($_id);
        if(empty($data))
            Route::page404();
        else {
            $data["reviews"] = (new ModelReviews())->get_reviews($_id, true);
            $this->view->generate("view_product.php", $data);
        }
    }

    public function action_add() {
        header('Content-Type: application/json');
        $response["message"] = "";
        $response["description"] = "";
        $response["status"] = "error";

        if (!isset($_POST["name"]))
            $response["errors"]["name"] = "Не указано название.";
        if (!isset($_POST["description"]))
            $response["errors"]["description"] = "Не указано описание.";
        if (!isset($_POST["price"]))
            $response["errors"]["price"] = "Не указана цена.";

        $val = floatval($_POST["price"]);
        if ($val <= 0)
            $response["errors"]["price"] = "Неверно указана цена.";

        if (isset($response["errors"])) {
            $response["message"] = "Ошибка.";
            $response["status"] = "error";
        } else {
            if ($this->model->add($_POST["name"], $_POST["description"], $val)) {
                $response["message"] = "Товар добавлен!";
                $response["status"] = "success";
            }
            else {
                $response["message"] = "Товар не добавлен!";
                $response["status"] = "error";
            }
        }

        echo json_encode($response);
    }
}