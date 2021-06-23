$(document).ready(function () {
    panel_switch();

    $(".js-form").validate({
        rules: {
            price: {
                number: true,
                min: 1
            }
        },
        errorPlacement: function() {},
        submitHandler: function (form, e) { formSubmit(form, e); }
    });

    $(".js-table-fix").on("click", function () {
        $.ajax({
            url: "/admin_panel/fix_tables",
            success: function (response) { $(".status").html(response); }
        });
    });
    $(document).on("submit", ".js-form-reviews", function () { return false; });
    $(document).on("click", ".js-publish, .js-delete", function (e) {
        $this = $(this);
        $form = $this.closest("form");
        $data = $form.serializeArray();
        $data.push({name: $this.attr("name"), value:$this.val()});
        $.ajax({
            url: $form.attr("action"),
            method: "post",
            data: $data,
            success: function (response) { $(".moderation").html(response); }
        });
        return false;
    });

    function panel_switch() {
        $(".panel-side").on("click", ".js-add-side, .js-status-side, .js-moderation-side", function () {
            let classes = $(this).attr("class").split(" ");
            let $status = $(".status"),
                $add = $(".add"),
                $moderation = $(".moderation"),
                $status_side = $(".js-status-side"),
                $add_side = $(".js-add-side"),
                $moderation_side = $(".js-moderation-side");

            $status.hide(200);
            $add.hide(200);
            $moderation.hide(200);
            $status_side.removeClass("active");
            $add_side.removeClass("active");
            $moderation_side.removeClass("active");
            switch (classes[0]) {
                case "js-status-side":
                    $status.show(400);
                    $status_side.addClass("active");
                    break;
                case "js-add-side":
                    $add.show(400);
                    $add_side.addClass("active");
                    break;
                case "js-moderation-side":
                    $moderation.show(400);
                    $moderation_side.addClass("active");
                    break;
            }
        });
    }

    function formSubmit(form, event) {
        event.preventDefault();
        let $form = $(form);
        localStorage.clear();
        $.ajax({
            type: $form.attr("method"),
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (response) { catchFormResponse(response); }
        })
    }

    function catchFormResponse(response) {
        if(response.status === "error") {
            let message = "";
            let errors = response.errors;
            $.each(errors, function (key, el) {
                message += el;
                $("textarea[name=" + key + "]").addClass("error");
            });
            response.description = message;
        }

        showNotify(response);
    }

    function showNotify(response) {
        let title = response.message,
            message = response.description,
            isError = response.status === "error";
        let $notify = $(".notify");
        let $notify_clone = $notify.first().clone();

        $notify_clone.appendTo("body");
        $notify_clone.css("z-index", +$notify.last().css("z-index") + 1);
        $notify_clone.children(".title").text(title);
        $notify_clone.children(".message").text(message);
        if (isError)
            $notify_clone.addClass("error");

        $notify_clone.animate({top: '50px'}, "slow");
        setTimeout(function () {
            $notify_clone.animate({top: '-100px'}, "slow");
            setTimeout(function() { $notify_clone.remove(); }, 500);
        }, 5000);
    }

    $(".js-prev").on("click", function () {
        if($(this).hasClass("disabled"))
            return;
        let current = $(".js-current").text();
        $(".js-pag-form-page").val(current-1);
        $(".js-pag-form").submit();
    });
    $(".js-next").on("click", function () {
        if($(this).hasClass("disabled"))
            return;
        let current = $(".js-current").text();
        $(".js-pag-form-page").val(+current+1);
        $(".js-pag-form").submit();
    });

    $(".js-sort").on("click", "li", function () {
        let $this = $(this);
        $(".js-pag-form-order-by").val($this.data("order-by"));
        if($this.children("i").hasClass("fa-sort-up"))
            $(".js-pag-form-order-type").val("DESC");
        else
            $(".js-pag-form-order-type").val("ASC");
        $(".js-pag-form").submit();
    });
});

