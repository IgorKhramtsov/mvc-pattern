<?php

include __DIR__."/../models/model_reviews.php";

class ControllerAdmin extends Controller {

    public function __construct() {
        $this->model = new ModelAdmin();
        parent::__construct();
    }

    public function action_index() {
        $data = array("title" => "Панель администратора");
        $data["data"] = $this->model->checkTables();
        $data["reviews"] = $this->model->get_all_reviews( false);

        $this->view->generate("view_admin_panel.php", $data);
    }

    public function action_fix_tables() {
        $data = [];
        $this->model->fix_tables();
        $data["data"] = $this->model->checkTables();
        $this->view->generate("admin_panel/view_admin_status.php", $data,
            "view_empty_template.php");
    }

    public function action_moderate() {
        $_id = $_POST["review_id"];
        $action = $_POST["action"];

        $id = intval($_id);
        if($id <= 0)
            return;

        if($action !== "delete") {
            $action = "approve";
        }
        $this->model->moderate_review($id, $action);
        $data["reviews"] = $this->model->get_all_reviews( false);
        $this->view->generate("admin_panel/view_admin_moderation.php", $data, "view_empty_template.php");
    }

    public function action_adding() {
        $data["title"] = "Добавить товар";
        $this->view->generate("view_admin_panel.php", $data);
    }
}