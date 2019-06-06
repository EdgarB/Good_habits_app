function stop_propagation_on_click_for(class_name){
    var elements = document.getElementsByClassName(class_name);
    var elem_size = elements.length;

    for(var i=0; i < elem_size; i++){
        elements[i].addEventListener('mousedown', function(){

            event.stopPropagation();
        });
        elements[i].addEventListener('click', function(){

            event.stopPropagation();
        });
    }

}

document.addEventListener('DOMContentLoaded', function() {

    stop_propagation_on_click_for("btn_add_log");
    var activity_cards = document.getElementsByClassName("activity_card");
    var amount_activity_cards = activity_cards.length;


    for(var i= 0; i < amount_activity_cards; i++){
        activity_cards[i].addEventListener('mousedown', function(){
            this.classList.add('bluish_background');
        });
        activity_cards[i].addEventListener('mouseup', function(){
            this.classList.remove('bluish_background');
            window.location.href = this.getElementsByClassName('url_to_logs')[0].href;

            //alert( this.getElementsByClassName('url_to_logs')[0].href);
        });
    }





}, false);
