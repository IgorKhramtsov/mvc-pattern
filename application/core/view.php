<?php


class View {

    public $template_file = "view_main_template.php";
    public function generate($content_file, $data=null, $user_template_file=null) {
        if(isset($data))
            if(is_array($data))
                extract($data);
        if(isset($user_template_file))
            $this->template_file = $user_template_file;

        include 'application/views/'.$this->template_file;
    }
}