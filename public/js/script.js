docReady(function() {
  document.getElementById("sidemenu-toggle").addEventListener("click", menuToggle);
  document.getElementById("nav-blur").addEventListener("click", closeSidemenu);
  
  function menuToggle(e){
    if(getCssProperty("sidemenu", "width")==="0px"){
        Velocity(document.querySelectorAll("#nav-blur"), { opacity: 0.6}, { duration: 500, display: "block" });
        Velocity(document.querySelectorAll("#sidemenu"), { width: '75%' }, { duration: 1000 });
    }else{
        Velocity(document.querySelectorAll("#nav-blur"), "fadeOut", { duration: 500 });
        Velocity(document.querySelectorAll("#sidemenu"), { width: '0' }, { duration: 500 });
    }
  }
  
  function closeSidemenu(e){
    Velocity(document.querySelectorAll("#nav-blur"), "fadeOut", { duration: 500 });
    Velocity(document.querySelectorAll("#sidemenu"), { width: '0' }, { duration: 500 });
  }
    
  function getCssProperty(elmId, property){
    var elem = document.getElementById(elmId);
    return window.getComputedStyle(elem,null).getPropertyValue(property);
  }
});//end tag
