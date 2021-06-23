<?php

class ControllerMain extends Controller {

    public function action_index()
    {
        $data = array(title => "Главная страница");
        $this->view->generate("view_main.php", $data);
    }
}