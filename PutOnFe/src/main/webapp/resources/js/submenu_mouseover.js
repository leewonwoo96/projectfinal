const submenus = document.querySelectorAll('.submenu a');
for(let submenu of submenus){
    submenu.addEventListener("mouseover",function(){
        submenu.parentNode.parentNode.childNodes[1].style.backgroundColor="black";
    });
    submenu.addEventListener("mouseout",function(){
        submenu.parentNode.parentNode.childNodes[1].style.backgroundColor="";
    });
}